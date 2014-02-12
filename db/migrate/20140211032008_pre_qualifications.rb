class PreQualifications < ActiveRecord::Migration
  def change
    create_table :pre_qualifications do |t|
      t.belongs_to :user
      t.belongs_to :vendor
      t.boolean    :assigned
      t.datetime   :start_time
      t.datetime   :end_time
      t.timestamps
    end
  end
end
