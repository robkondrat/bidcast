class Api::BidsController < ApplicationController

  before_action :authenticate_user, except: [:index, :show]

  def index
    @bids = Bid.all 
    render "index.json.jb"
  end

  def create
    @bid = Bid.new(
              price: params[:price],
              advertiser_id: params[:advertiser_id],
              space_id: params[:space_id]
              )
    if @bid.save
      render "show.json.jb"
    else
      render json: {errors: @bid.errors.full_messages}, status: :unprocessable_entity
    end
  end

  def show
    @bid = Bid.find(params[:id])
    render 'show.json.jb'
  end

  def update
    @bid = Bid.find(params[:id])

    @bid.price = params[:price] || @bid.price
    @bid.advertiser_id = params[:advertiser_id] || @bid.advertiser_id
    @bid.space_id = params[:space_id] || @bid.space_id

    if @bid.save
      render "show.json.jb"
    else
      render json: {errors: @bid.errors.full_messages}, status: :unprocessable_entity
    end
  end

  def destroy
    bid = Bid.find(params[:id])
    bid.delete
    render json: {message: "Bid ID #{bid.id} successfully deleted."}
  end
end
