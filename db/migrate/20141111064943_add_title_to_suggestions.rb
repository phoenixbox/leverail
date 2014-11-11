class AddTitleToSuggestions < ActiveRecord::Migration
  def change
  	add_column :suggestions, :title, :string
  end
end
