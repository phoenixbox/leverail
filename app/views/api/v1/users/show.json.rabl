object @user

attributes :id, :email, :authentication_token

child(:vendors) do
  attributes :id, :title, :description, :summary, :vendor_type, :thumbnail, :phone_number, :website_url, :address, :city, :state, :zip_code
end