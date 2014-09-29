Rails.application.routes.draw do

  authenticated :user do
    root :to => "home#index", :as => "authenticated_root"
  end

  root :to => 'welcome#index'

  devise_for :users,
             :controllers => { registrations: 'registrations' }

  resources :users

  resources :auctions do
    resources :bids
    resources :pictures
  end

end
