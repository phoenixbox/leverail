class AddSuggestionIdToProposal < ActiveRecord::Migration
  def change
  	add_column :proposals, :suggestion_id, :integer
  end
end
