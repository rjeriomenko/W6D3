class Artwork < ApplicationRecord
    validates :artist_id, :title, :image_url, presence: true
    validates :image_url, uniqueness: true 
    validates :artist_id, uniqueness: { scope: :title } 
    
    belongs_to :artist,
        foreign_key: :artist_id,
        class_name: :User,
        inverse_of: :artworks 

    has_many :artwork_shares,
        foreign_key: :artwork_id,
        class_name: :ArtworkShares 

    has_many :shared_viewers, 
        through: :artwork_shares,
        source: :viewer

end
