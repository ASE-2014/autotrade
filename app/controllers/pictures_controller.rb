class PicturesController < ApplicationController
  before_filter  :owns_auction!, :only => [:create, :update, :edit, :destroy]

  def create
    @auction = Auction.find(params[:auction_id])
    @picture = @auction.picture.create(picture_params)
    @picture.save

    redirect_to auction_path(@auction)
  end

  def picture_params
    params.require(:picture).permit(:url)
  end

end
