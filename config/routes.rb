Rails.application.routes.draw do

  devise_for :users
	root to: "home#index"

  resources :auctions do
    resources :bids
  end

end
