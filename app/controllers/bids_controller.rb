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
    if is_valid? @bid, @auction
      @bid.user = current_user
      @bid.save
      @auction.update_price
    else
      flash[:error] = 'Bid is not high enough'
      @bid.destroy
    end
    redirect_to auction_path(@auction)
  end

  private
  def bid_params
    params.require(:bid).permit(:max_bid)
  end

  def is_valid? bid, auction
    # 1st cond: bidder isn't owner of auction
    # 2nd cond: bid is bigger than current price of auction or
    #           bid is equal to current price of auction and this is the first bid made
    auction.user != current_user and (bid.max_bid > auction.price or (bid.max_bid == auction.price and auction.bids.size == 1))
  end

end
