class DropInstallsTable < ActiveRecord::Migration
  def change
    drop_table :installs
  end
end
