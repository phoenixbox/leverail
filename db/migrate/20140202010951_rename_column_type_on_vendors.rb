class RenameColumnTypeOnVendors < ActiveRecord::Migration
  def change
    change_table :vendors do |t|
      t.rename :type, :vendor_type
    end
  end
end
