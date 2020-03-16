class Api::SpacesController < ApplicationController
  before_action :authenticate_podcast, except: [:index, :show]
  

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
    if @space.save
      render "show.json.jb"
    else
      render json: { errors: @space.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def show
    @space = Space.find(params[:id])
    render 'show.json.jb'
  end

  def update
    @space = Space.find(params[:id])

    @space.podcast_id = params[:podcast_id] || @space.podcast_id
    @space.length = params[:length] || @space.length

    if @space.save
      render "show.json.jb"
    else
      render json: { errors: @space.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    space = Space.find(params[:id])
    space.delete
    render json: {message: "Space ID #{space.id} successfully deleted."}
  end


end
