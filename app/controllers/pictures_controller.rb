class PicturesController < ApplicationController
  before_filter  :owns_auction!

  def create
    @auction = Auction.find(params[:auction_id])
    @picture = @auction.pictures.create(picture_params)
    @picture.save

    redirect_to auction_path(@auction)
  end

  def show
    @auction = Auction.find(params[:auction_id])
    @picture = @auction.pictures.find(params[:id])
  end

  def picture_params
    params.require(:picture).permit(:url)
  end

end
