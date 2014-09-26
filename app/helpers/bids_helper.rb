module BidsHelper
  def min_bid
    @bids.empty? ? @auction.price : (@auction.price+1)
  end
end
