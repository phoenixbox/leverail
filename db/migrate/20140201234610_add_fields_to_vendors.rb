class AddFieldsToVendors < ActiveRecord::Migration
  def change
    change_table :vendors do |t|
      t.text     :summary
      t.string   :phone_number
      t.string   :website
      t.string   :address
      t.string   :city
      t.string   :state
      t.string   :zip
    end
  end
end
