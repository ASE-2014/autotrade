module AuctionsHelper
  def has_no_bids
    @auction.bids.empty?
  end

  def time_remaining
    (@auction.created_at + @auction.duration*60) - Time.now
  end

  def minutes_remaining
    ((time_remaining/60).floor).to_s
  end

  def seconds_remaining
    ((time_remaining%60).floor).to_s
  end

  def auction_running?
    time_remaining>0
  end

end
