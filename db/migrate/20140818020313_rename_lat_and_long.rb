class RenameLatAndLong < ActiveRecord::Migration
  def change
  	change_table :tags do |t|
      t.rename :lat, :latitude
    end
  end
end
