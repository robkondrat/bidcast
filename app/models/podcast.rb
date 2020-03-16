class Podcast < User
  has_many :spaces, dependent: :destroy
  has_one_attached :image
  

end
