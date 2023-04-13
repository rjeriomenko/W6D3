class UpdateArtworkShares < ActiveRecord::Migration[7.0]
  def change
    remove_column :artwork_shares, :user_id

    add_column :artwork_shares, :viewer_id, :bigint, null: false
    
    add_index :artwork_shares, :viewer_id 
    add_index :artwork_shares, [:viewer_id, :artwork_id], unique: true

    add_foreign_key :artwork_shares, :users, column: :viewer_id 

  end
end
