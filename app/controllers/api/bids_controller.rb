class Api::BidsController < ApplicationController

  before_action :authenticate_advertiser, except: [:index, :show]

  def index
    @bids = Bid.all 
    render "index.json.jb"
  end

  def create
    @bid = Bid.new(
              price: params[:price],
              advertiser_id: current_advertiser.id,
              space_id: params[:space_id]
              )

    
    if @bid.save
      podcast = @bid.podcast
      spaces = podcast.spaces

      formatted_spaces = spaces.map { |space| 
        {
          id: space.id,
          podcast_id: space.podcast_id,
          length: space.length,
          active: space.active,
          created_at: space.created_at,
          time_left: space.time_left,
          highest_bid: space.highest_bid,
          deadline: space.deadline,
          winning_advertiser: space.winning_advertiser,
          winning_advertiser_id: space.winning_advertiser_id,
          
          podcast: {
            id: space.podcast.id,
            name: space.podcast.name,
            description: space.podcast.description,
            email: space.podcast.email
          },

          bids: space.bids.map {|bid| 
            {
              id: bid.id,
              price: bid.price,

              advertiser: {
                id: bid.advertiser.id,
                name: bid.advertiser.name,
                description: bid.advertiser.description,
                email: bid.advertiser.email
              },

              space: {
                id: bid.space.id,
                podcast_id: bid.space.podcast_id,
                length: bid.space.length,
                active: bid.space.active,
                highest_bid: bid.space.highest_bid,
                time_left: bid.space.time_left,
                podcast: {
                  id: bid.space.podcast.id,
                  name: bid.space.podcast.name,
                  description: bid.space.podcast.description,
                  email: bid.space.podcast.email
                }
              }
            }
          }
        }
      }

      ActionCable.server.broadcast "spaces_channel", formatted_spaces

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
