class Bid < ApplicationRecord
  belongs_to :space
  belongs_to :advertiser

  validates :price, presence: true, numericality: { greater_than: 0, less_than: 10000.00 }


  def check_highest

  end


end
