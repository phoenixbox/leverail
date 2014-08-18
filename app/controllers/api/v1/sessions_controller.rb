module Api
  module V1
    class SessionsController < Devise::SessionsController
      respond_to :json
      prepend_before_filter :require_no_authentication, :only => [:create ]

      before_filter :ensure_params_exist

      def create
        user = User.find_for_database_authentication(:email=>params[:email])
        return invalid_login_attempt unless user

        if user.valid_password?(params[:password])
          sign_in("user", user)
          redirect_to api_v1_user_path(user)
          return
        end
        invalid_login_attempt
      end

      def destroy
        sign_out(resource_name)
      end

      protected
      def ensure_params_exist
        return unless params[:email].blank?
        render :json=>{:success=>false, :message=>"missing user_login parameter", :status=>422}, :status=>422
      end

      def invalid_login_attempt
        warden.custom_failure!
        render :json=> {:success=>false, :message=>"Error with your login or password", :status=>401}, :status=>401
      end

      def missing_params
        warden.custom_failure!
        return render json: {}, status: 400
      end

      def invalid_credentials
        warden.custom_failure!
        render json: {}, status: 401
      end

      def remember_token(resource)
        data = resource_class.serialize_into_cookie(resource)
        "#{data.first.first}-#{data.last}"
      end

      def resource_from_remember_token
        token = params[:remember_token]
        id, identifier = token.split('-')
        resource_class.serialize_from_cookie(id, identifier)
      end

      def resource_from_credentials
        data = { email: params[:email] }
        if res = resource_class.find_for_database_authentication(data)
          if res.valid_password?(params[:password])
            res
          end
        end
      end
    end
  end
end