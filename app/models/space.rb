class Space < ApplicationRecord
  belongs_to :podcast
  has_many :bids, dependent: :destroy

  validates :length, presence: true, numericality: { greater_than: 0, less_than: 210 }

  def expired?
    update(active: false) if created_at <= 3.days.ago && active
    !active
  end

  def time_left
    if active
      remaining = (created_at + 3.days) - Time.now
    end
  end

  def highest_bid
    prices = bids.map{ |bid| bid.price }
    prices.max
  end

  def winning_advertiser
    if bids != []
      bids.each do |bid|
        if bid.price == highest_bid
          return bid.advertiser.name
        end
      end
    end

  end

  def deadline
    (created_at + 3.days).strftime("%b %e, %l:%M %p")
  end


end
