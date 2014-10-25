class RemoveSuggestionsSuggestorId < ActiveRecord::Migration
  def change
  	remove_column :suggestions, :suggestor_id
  end
end
