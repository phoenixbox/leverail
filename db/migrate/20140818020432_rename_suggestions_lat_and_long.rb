class RenameSuggestionsLatAndLong < ActiveRecord::Migration
  def change
		change_table :suggestions do |t|
	    t.rename :lat, :latitude
	    t.rename :long, :longitude
	  end
  end
end