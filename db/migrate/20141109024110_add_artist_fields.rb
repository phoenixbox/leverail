class AddArtistFields < ActiveRecord::Migration
  def change
  	add_column :artists, :profile_image_url, :string
		add_column :artists, :authentication_token, :string
		add_index  :artists, :authentication_token, :unique => true
  end
end
