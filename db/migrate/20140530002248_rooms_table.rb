class RoomsTable < ActiveRecord::Migration
  def change
  	create_table :rooms do |t|
  		t.integer :user_id, null: false
  		t.string :title
  		t.string :video_url
			t.datetime "created_at"
	    t.datetime "updated_at"
  	end
  end
end
