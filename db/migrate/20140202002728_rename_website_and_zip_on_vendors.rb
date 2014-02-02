class RenameWebsiteAndZipOnVendors < ActiveRecord::Migration
  def change
    change_table :vendors do |t|
      t.rename :website, :website_url
      t.rename :zip, :zip_code
    end
  end
end