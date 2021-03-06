class Api::UsersController < ApplicationController


  def index
    @users = Podcast.all
    render "index.json.jb"
  end

  def create
    @user = User.new(
                    name: params[:name],
                    description: params[:description],
                    image: params[:image],
                    email: params[:email],
                    password: params[:password],
                    password_confirmation: params[:password_confirmation],
                    type: params[:type],
                    youtube_url: params[:youtube_url]
                    )

    @user.youtube_embed

    if @user.save
      render json: { message: "User created successfully" }, status: :created
    else
      render json: { errors: @user.errors.full_messages }, status: :bad_request
    end

  end

  def show
    @user = User.find(params[:id])
    render 'show.json.jb'
  end

  def update
    @user = User.find(params[:id])

    @user.name = params[:name] || @user.name
    @user.description = params[:description] || @user.description
    @user.email = params[:email] || @user.email
    @user.youtube_url = params[:youtube_url] || @user.youtube_url
    # @user.image = params[:image] || @user.image

    @user.youtube_embed

    if @user.save
      render "show.json.jb"
    else
      render json: { errors: @user.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy

    user = User.find(params[:id])
    if user.type == "Podcast"
      Podcast.find(params[:id]).delete
    else
      Advertiser.find(params[:id]).delete
    end
    render json: {message: "User ID #{user.id} successfully deleted."}
  end

end
