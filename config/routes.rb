Rails.application.routes.draw do
<<<<<<< HEAD

  devise_for :users
	root to: "home#index"
	
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".
=======
>>>>>>> dev

  resources :auctions do
    resources :bids
  end

end
