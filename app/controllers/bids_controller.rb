class BidsController < ApplicationController

  # Bids are final. Once a bid has been placed, it cannot be edited or deleted.
  # So there's no need for update and destroy methods.
  # Also no need for a show method since bids do not need their own view (they're listed per auction).

  def create
    # TODO: only let a bid be created if bid.max_bid > auction.price!!!
    @auction = Auction.find(params[:auction_id])
    @bidder = current_user
    @bid = @auction.bids.create(bid_params)
    # notify the auction to update its price
    @auction.update_price
    redirect_to auction_path(@auction)
  end

  private
  def bid_params
    params.require(:bid).permit(:max_bid, :bidder)
  end
end
