class User < ApplicationRecord
  has_secure_password

  validates :email, presence: true, uniqueness: true
  validates :name, presence: true, uniqueness: true
  validates :password, presence: true, on: :create
  validates :type, inclusion: { in: ["Podcast", "Advertiser"]}

end
