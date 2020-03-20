class Bid < ApplicationRecord
  belongs_to :space
  has_one :podcast, through: :space
  belongs_to :advertiser

  validates :price, presence: true, numericality: { greater_than: 0, less_than: 10000.00 }

end
