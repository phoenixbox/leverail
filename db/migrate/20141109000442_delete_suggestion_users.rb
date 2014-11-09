class DeleteSuggestionUsers < ActiveRecord::Migration
  def change
  	drop_table :suggestion_users
  end
end
