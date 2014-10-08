class AddSuggestorIdToSuggestions < ActiveRecord::Migration
  def change
  	change_table :suggestions do |t|
  		t.integer :suggestor_id, null: false
  	end
  end
end
