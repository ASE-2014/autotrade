class AuctionsController < ApplicationController

  before_filter :authenticate_user!, :except => [:index, :show]
  before_filter  :owns_auction!, :only => [:update, :edit, :destroy]

  def new
    @auction = Auction.new
  end

  def create
    @auction = Auction.new(auction_params)
    @auction.user = current_user

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
    @bids = @auction.bids.sort_by{ |b| b.max_bid }.reverse
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
    # TODO: auctions shouldn't really be editable. links in view should also be removed
    @auction = Auction.find(params[:id])
  end

  def destroy
    # TODO: auctions shouldn't really be deletable. links in view should also be removed
    @auction = Auction.find(params[:id])
    @auction.destroy
    redirect_to auctions_path
  end

  private
  def auction_params
    params.require(:auction).permit(:title, :description, :price)
  end

end
