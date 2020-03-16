class Advertiser < User
  has_many :bids, dependent: :destroy
  has_one_attached :image
  
end
