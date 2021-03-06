class AuctionsController < ApplicationController

  require 'google-search'

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
    running_auctions = Array.new
    closed_auctions = Array.new
    if params[:search]
      auctions = Auction.search(params[:search]).sort{|a,b|
        a.time_remaining <=> b.time_remaining }
    else
      auctions = Auction.all.sort{|a,b|
        a.time_remaining <=> b.time_remaining }
    end
    auctions.each do |a|
      if a.running?
        running_auctions.push(a)
      else
        closed_auctions.push(a)
      end
    end
    running_auctions.sort{|a,b|
      a.time_remaining  <=> b.time_remaining}
    closed_auctions.sort{|a,b|
      a.time_remaining  <=> b.time_remaining}.reverse
    @auctions = running_auctions.concat closed_auctions

  end

  def show
    @auction = Auction.find(params[:id])
    @bids = @auction.bids.sort_by{ |b| [-b.max_bid, b.created_at] } #sorts bid by max_bid DESC, created_at ASC
    @bidder = (@bids.first.nil? ? nil : @bids.first.user)
    # Fetch images from google
    @google_images = find_google_images(@auction.title)
    @user_pictures =  @auction.pictures
    @tweets = @auction.tweets
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

  def find_google_images(name)
    @images = Array.new
    Google::Search::Image.new(:query => name).first(5).each do |image|
      @images.push image
    end
    @images
  end

end
