class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def owns_auction!
    @auction = Auction.find(params[:id])
    unless @auction.user == current_user
      flash[:error] = 'You are not the owner of this auction!'
      redirect_to auctions_path
    end
  end

end