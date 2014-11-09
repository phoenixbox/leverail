class AddUsersIndexOnSuggestions < ActiveRecord::Migration
  def change
  	add_index :suggestions, :user_id
  end
end
