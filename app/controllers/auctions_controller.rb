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
    @current_user = current_user
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
    @auction = Auction.find(params[:id])
  end

  def destroy
    @auction = Auction.find(params[:id])
    unless @auction.bids.empty?
      flash[:error] = 'Auction already has bids, cannot be deleted!'
      redirect_to @auction
    end
    @auction.destroy
    redirect_to auctions_path
  end

  private
  def auction_params
    params.require(:auction).permit(:title, :description, :price, :duration)
  end

end