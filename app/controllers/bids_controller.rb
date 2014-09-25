class BidsController < ApplicationController

  # Bids are final. Once a bid has been placed, it cannot be edited or deleted.
  # So there's no need for update and destroy methods.
  # Also no need for a show method since bids do not need their own view (they're listed per auction).

  def create
    @auction = Auction.find(params[:auction_id])
    @bidder = User.find(params[:user_id])
    @bid = @auction.bids.create(bids_params)
    redirect_to auction_path(@auction)
  end

  private
  def bid_params
    params.require(:bid).permit(:max_bid, :bidder)
  end
end
