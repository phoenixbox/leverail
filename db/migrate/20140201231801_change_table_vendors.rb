class ChangeTableVendors < ActiveRecord::Migration
  def change
    change_table :vendors do |t|
      t.rename :name, :title
      t.string :type
      t.string :description
      t.string :thumbnail
    end
  end
end
