class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :null_session, :if => Proc.new { |c| c.request.format == 'application/json' }

  before_filter :authenticate_user_from_token!
  ## This is Devise's authentication
  #before_filter :authenticate_user!

  private

  def authenticate_user_from_token!
    user_email = params[:email].presence
    user       = user_email && User.find_by_email(user_email)

    if user && Devise.secure_compare(user.authentication_token, params[:authentication_token])
      sign_in user
      #sign_in user, store: false
    end
  end
end
