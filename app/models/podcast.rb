class Podcast < User
  has_many :spaces, dependent: :destroy

end
