class CreateArtists < ActiveRecord::Migration
  def change
    create_table :artists do |t|
    	t.string "name"
    	t.string "profile_image_url"
    	t.timestamps
    end
  end
end
