class AddUserIdToSuggestions < ActiveRecord::Migration
  def change
  	change_table :suggestions do |t|
  	  t.integer "user_id"
  	end
  end
end
