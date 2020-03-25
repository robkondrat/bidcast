class Message < ApplicationRecord
  belongs_to :user

  def user_type
    if user.type == "Podcast"
      return "Podcast"
    else
      return "Advertiser"
    end
  end
end
