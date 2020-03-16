class Api::AdvertisersController < ApplicationController
  before_action :authenticate_advertiser, except: [:index, :show, :create]
  
  
  def index
    @advertisers = Advertiser.all
    render "index.json.jb"
  end

  def create
    @advertiser = Advertiser.new(
                    name: params[:name],
                    description: params[:description],
                    image: params[:image],
                    email: params[:email],
                    password: params[:password],
                    password_confirmation: params[:password_confirmation],
                    type: params[:type]
                    )

    if @advertiser.save
      render json: { message: "Advertiser created successfully" }, status: :created
    else
      render json: { errors: advertiser.errors.full_messages }, status: :bad_request
    end

  end

  def show
    @advertiser = Advertiser.find(params[:id])
    render 'show.json.jb'
  end

  def update
    @advertiser = Advertiser.find(params[:id])

    @advertiser.name = params[:name] || @advertiser.name
    @advertiser.description = params[:description] || @advertiser.description
    @advertiser.email = params[:email] || @advertiser.email

    if @advertiser.save
      render "show.json.jb"
    else
      render json: { errors: @advertiser.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    advertiser = Advertiser.find(params[:id])
    advertiser.delete
    render json: {message: "Advertiser ID #{user.id} successfully deleted."}
  end
end
