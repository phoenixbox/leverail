class SuggestionUsers < ActiveRecord::Migration
  def change
    create_table :suggestion_users do |t|
    	t.belongs_to 	:suggestion
	    t.belongs_to 	:user
      t.timestamps
    end
    add_index :suggestion_users, [:suggestion_id, :user_id], :unique => true
  end
end
