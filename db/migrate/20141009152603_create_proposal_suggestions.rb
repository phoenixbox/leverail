class CreateProposalSuggestions < ActiveRecord::Migration
  def change
    create_table :proposal_suggestions do |t|
    	t.belongs_to 	:proposal
	    t.belongs_to 	:suggestion
	    t.integer 		:vote_count
      t.timestamps
    end
    add_index :proposal_suggestions, [:proposal_id, :suggestion_id], :unique => true
  end
end
