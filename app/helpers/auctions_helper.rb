module AuctionsHelper
  def has_no_bids
    self.bids.empty?
  end
end
