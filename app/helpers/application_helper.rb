module ApplicationHelper
  def is_own_auction?
    @auction = Auction.find(params[:id].nil? ? params[:auction_id] : params[:id])
    @auction.user == current_user
  end
end
