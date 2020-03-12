class Advertiser < User
  has_many :bids, dependent: :destroy
end
