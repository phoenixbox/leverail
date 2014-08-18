class RenameTagsLong < ActiveRecord::Migration
  def change
  		change_table :tags do |t|
  	    t.rename :long, :longitude
  	  end
  end
end