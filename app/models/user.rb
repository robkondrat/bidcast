class User < ApplicationRecord
  has_secure_password
  has_one_attached :image
  has_many :messages

  validates :email, presence: true, uniqueness: true
  validates :name, presence: true, uniqueness: true
  validates :password, presence: true, on: :create
  validates :type, inclusion: { in: ["Podcast", "Advertiser"]}


  def youtube_embed
    if youtube_url
      youtube_url.sub!("watch?v=", "embed/")
    end
  end

end
