class BidsController < ApplicationController

  # Bids are final. Once a bid has been placed, it cannot be edited or deleted.
  # So there's no need for update and destroy methods.
  # Also no need for a show method since bids do not need their own view (they're listed per auction).

  before_filter :authenticate_user!
  before_filter :others_auction!

  def create
    # TODO: only let a bid be created if bidder isn't the creator of the auction!
    # TODO: validate that bid param exists and is numerical
    @auction = Auction.find(params[:auction_id])
    @bid = @auction.bids.create(bid_params)
    if @bid.max_bid < @auction.price or ( @bid.max_bid == @auction.price and @auction.bids.size > 1 )
        # if bid is smaller than current price of auction
        # or bid is equal to current price of auction and this is not the first bid made
        flash[:error] = 'Bid is not high enough'
        @bid.destroy
    else
      @bid.user = current_user
      @bid.save
      @auction.update_price
    end
    redirect_to auction_path(@auction)
  end

  private
  def bid_params
    params.require(:bid).permit(:max_bid)
  end
end
