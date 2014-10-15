class CreateUpvotes < ActiveRecord::Migration
  def change
    create_table :upvotes do |t|
	    t.belongs_to 	:suggestion
    	t.belongs_to 	:user
      t.timestamps
    end
    add_index :upvotes, [:suggestion_id, :user_id], :unique => true
  end
end
