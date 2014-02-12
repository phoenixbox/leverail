class AddIndexesOnPreQualifications < ActiveRecord::Migration
  def change
    add_index :pre_qualifications, [:user_id, :vendor_id], :unique => true
  end
end
