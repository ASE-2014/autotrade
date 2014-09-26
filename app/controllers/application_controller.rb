class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :configure_permitted_parameters, if: :devise_controller?

  def owns_auction!
    unless is_own_auction?
      flash[:error] = 'You are not the owner of this auction!'
      redirect_to auctions_path
    end
  end

  def others_auction!
    if is_own_auction?
      redirect_to auctions_path
    end
  end

  protected

  def is_own_auction?
    @auction = Auction.find(params[:id].nil? ? params[:auction_id] : params[:id])
    @auction.user == current_user
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << :username
  end

end