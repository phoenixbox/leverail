class ChangeRoomsToHotels < ActiveRecord::Migration
  def change
  	rename_table :rooms, :hotels
  end
end
