class User < ApplicationRecord
  has_secure_password
  has_one_attached :image

  validates :email, presence: true, uniqueness: true
  validates :name, presence: true, uniqueness: true
  validates :password, presence: true, on: :create
  validates :type, inclusion: { in: ["Podcast", "Advertiser"]}

end
