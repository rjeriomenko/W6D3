class CreateArtwork < ActiveRecord::Migration[7.0]
  def change
    create_table :artworks do |t|
      t.string :title, null: false 
      t.string :image_url, null: false, unique: true 
      t.bigint :artist_id, null: false 
      t.timestamps
    end
    add_foreign_key :artworks, :users, column: :artist_id
    add_index :artworks, :artist_id
    add_index :artworks, [:artist_id, :title], unique: true 
  end
end
