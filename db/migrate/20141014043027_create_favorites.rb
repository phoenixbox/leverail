class CreateFavorites < ActiveRecord::Migration
  def change
    create_table :favorites do |t|
    	t.belongs_to 	:user
	    t.belongs_to 	:tag
      t.timestamps
    end
    add_index :favorites, [:user_id, :tag_id], :unique => true
  end
end
