class CreateOffer < ActiveRecord::Migration
  def change
    create_table :offers do |t|
      t.string   :description
      t.string   :summary
      t.string   :terms
      t.datetime :expiration
      t.string   :description
      t.integer  :value
      t.integer  :pre_qualification_id
      t.boolean  :converted
    end
    add_index :offers, :pre_qualification_id
  end
end