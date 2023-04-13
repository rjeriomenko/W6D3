class ArtworkShare < ApplicationRecord
    validates :viewer_id, :artwork_id, presence: true
    validates :viewer_id, uniqueness: { scope: :artwork_id } 
    
    belongs_to :viewer,
        foreign_key: :viewer_id,
        class_name: :User,
        inverse_of: :artwork_shares 
 
    belongs_to :artwork,
        foreign_key: :artwork_id,
        class_name: :Artwork,
        inverse_of: :artwork_shares 
    

end
