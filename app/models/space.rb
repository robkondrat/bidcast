class Space < ApplicationRecord
  belongs_to :podcast
  has_many :bids, dependent: :destroy

  validates :length, presence: true, numericality: { greater_than: 0, less_than: 210 }

  def expired?
    update(active: false) if created_at <= 3.days.ago && active
    !active
  end


end
