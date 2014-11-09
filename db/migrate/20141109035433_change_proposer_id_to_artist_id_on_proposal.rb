class ChangeProposerIdToArtistIdOnProposal < ActiveRecord::Migration
  def change
  	change_table :proposals do |t|
	  	t.rename :proposer_id, :artist_id
  	end
  end
end
