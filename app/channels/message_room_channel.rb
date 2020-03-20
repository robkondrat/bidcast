class MessageRoomChannel < ApplicationCable::Channel
  def subscribed
    stream_from "message_room_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
