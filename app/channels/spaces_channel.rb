class SpacesChannel < ApplicationCable::Channel
  def subscribed
    stream_from "spaces_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
