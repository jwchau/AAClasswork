class Artwork < ApplicationRecord
    validates :title, :image_url, presence: true

    belongs_to :artist,
    foreign_key: :artist_id,
    class_name: :User

    has_many :viewers,
    foreign_key: :viewer_id,
    class_name: :User

    has_many :shared_viewers,
    through: :viewers,
    source: :artworks #possibly?
end
