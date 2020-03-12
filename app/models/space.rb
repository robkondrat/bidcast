class Space < ApplicationRecord
  belongs_to :podcast
  has_many :bids

  validates :length, presence: true
  validates :active, presence: true
  validates :boolean_field_name, inclusion: { in: [true, false] }

  def podcast
    Podcast.find_by(id: self.podcast_id)
  end

  def expired?
    update(active: false) if created_at >= 3.days.ago && active
    !active
  end


end
