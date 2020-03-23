class Podcast < User
  has_many :spaces, dependent: :destroy
  has_one_attached :image
  

  def youtube_embed
    if youtube_url
      youtube_url.sub!("watch?v=", "embed/")
    end
  end

end
