class UpdateTags < ActiveRecord::Migration
  def change
  	remove_column :tags, :address
  	add_column :tags, :canvas_type, :string
  	add_column :tags, :country, :string
  end
end
