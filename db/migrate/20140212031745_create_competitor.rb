class CreateCompetitor < ActiveRecord::Migration
  def change
    create_table :competitors do |t|
      t.integer "vendor_id"
      t.integer "competitor_id"
      t.integer "intensity"
    end
  end
end