class AuctionsController < ApplicationController
  def new
    @auction = Auction.new
  end

  def create
    @auction = Auction.new(auction_params)

    if @auction.save
      redirect_to @auction
    else
      render 'new'
    end
  end

  def index
    @auctions = Auction.all
  end

  def show
    @auction = Auction.find(params[:id])
  end

  private
  def auction_params
    params.require(:auction).permit(:title, :description, :min_price)
  end

end