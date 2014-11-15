class AddTimestampsToSuggestions < ActiveRecord::Migration
  def change
  	add_column :suggestions, :created_at, :datetime
  	add_column :suggestions, :updated_at, :datetime
  end
end