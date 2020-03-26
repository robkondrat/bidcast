class Api::MessagesController < ApplicationController
  def index
    @messages = Message.all.order(id: :desc)
    render 'index.json.jb'
  end

  def create
    @message = Message.new(
      user_id: current_user.id,
      body: params[:body]
      )

    # @message.user_type

    @message.save

    ActionCable.server.broadcast "message_room_channel", {
      id: @message.id,
      user_id: @message.user_id,
      body: @message.body,
      name: @message.user.name,
      user_type: @message.user_type,
      created_at: @message.created_at.strftime("%b %e, %l:%M %p")
    }

    render 'show.json.jb'
  end

  def show
    @message = Message.find(params[:id])
    render 'show.json.jb'
  end
end
