module AuctionsHelper
  def has_no_bids
    @auction.bids.empty?
  end

  def time_remaining
    (@auction.created_at + @auction.duration*60) - Time.now
  end

end
