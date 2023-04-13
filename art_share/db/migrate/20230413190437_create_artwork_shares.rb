class CreateArtworkShares < ActiveRecord::Migration[7.0]
  def change
    create_table :artwork_shares do |t|
      t.bigint :artwork_id, null: false
      t.bigint :user_id, null: false
      t.timestamps
    end
    add_index :artwork_shares, :artwork_id
    add_index :artwork_shares, :user_id

    add_foreign_key :artwork_shares, :artworks, column: :artwork_id
    add_foreign_key :artwork_shares, :users, column: :user_id
  end
end
