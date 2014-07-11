class UpdateHotelUserAndTitle < ActiveRecord::Migration
  def change
  	remove_column :hotels, :user_id
  	rename_column :hotels, :title, :name
  end
end
