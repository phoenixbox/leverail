class AddImageUrlToTags < ActiveRecord::Migration
  def change
  change_table :tags do |t|
    t.string   :image_url
	end
  end
end
