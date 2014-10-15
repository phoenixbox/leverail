class AddArtistRefToTags < ActiveRecord::Migration
  def change
    add_reference :tags, :artist, index: true
  end
end
