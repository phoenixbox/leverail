class AddAddressToTag < ActiveRecord::Migration
  def change
  	add_column :tags, :address, :string
  end
end
