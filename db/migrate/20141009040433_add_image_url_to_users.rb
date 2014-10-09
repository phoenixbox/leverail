class AddImageUrlToUsers < ActiveRecord::Migration
  def change
	  change_table :users do |t|
	    t.string   :profile_image_url
		end
  end
end
