class CreateProposals < ActiveRecord::Migration
  def change
    create_table :proposals do |t|
    	t.string		:image_url
    	t.integer 	:proposer_id
      t.timestamps
    end
  end
end
