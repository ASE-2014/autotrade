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

  def update
    @auction = Auction.find(params[:id])

    if @auction.update(auction_params)
      redirect_to @auction
    else
      render 'edit'
    end
  end

  def edit
    @auction = Auction.find(params[:id])
  end

  private
  def auction_params
    params.require(:auction).permit(:title, :description, :min_price)
  end

end
