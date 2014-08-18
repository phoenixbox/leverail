class CreateTags < ActiveRecord::Migration
  def change
    create_table :tags do |t|
    	t.string		:title
    	t.string   	:address
      t.string   	:city
      t.string   	:state
      t.string   	:zip_code
    	t.decimal 	:lat, {:precision=>10, :scale=>6}
    	t.decimal 	:long, {:precision=>10, :scale=>6}
    end
  end
end
