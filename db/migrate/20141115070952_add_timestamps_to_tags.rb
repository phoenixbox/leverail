class AddTimestampsToTags < ActiveRecord::Migration
  def change
  	add_column :tags, :created_at, :datetime
  	add_column :tags, :updated_at, :datetime
  end
end