class Api::SpacesController < ApplicationController
  before_action :authenticate_podcast, except: [:index, :show, :test]
  

  def index
    @spaces = Space.all

    render "index.json.jb"
  end

  def create
    @space = Space.new(
        podcast_id: current_podcast.id,
        length: params[:length],
        active: true
        )
    @space.save

    render "show.json.jb"

  end

  def show
    @space = Space.find(params[:id])

    if @space.active
      @space.time_left = Time.now - @space.created_at
    end
    render 'show.json.jb'
  end

  def update
    @space = Space.find(params[:id])

    @space.podcast_id = params[:podcast_id] || @space.podcast_id
    @space.length = params[:length] || @space.length

    @space.save

    render "show.json.jb"

  end

  def destroy
    space = Space.find(params[:id])
    space.delete
    render json: {message: "Space ID #{space.id} successfully deleted."}
  end



end
