class ChangeFavoritesToNotAllowNullValues < ActiveRecord::Migration
  def change
  	change_column :favorites, :user_id, :integer, :null => false
  	change_column :favorites, :tag_id, :integer, :null => false
  end
end
