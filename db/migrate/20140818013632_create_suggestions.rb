class CreateSuggestions < ActiveRecord::Migration
  def change
    create_table :suggestions do |t|
    	t.string   	:address
    	t.string   	:canvas_type
      t.string   	:city
    	t.string		:image_url
      t.string   	:state
      t.string   	:zip_code
      t.string   	:country
    	t.decimal 	:lat, {:precision=>10, :scale=>6}
    	t.decimal 	:long, {:precision=>10, :scale=>6}
    end
  end
end