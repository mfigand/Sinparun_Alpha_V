Rails.application.routes.draw do

  devise_for :users
  devise_for :companies

  root to: "site#home"

  resources :users do
    resources :races, :coupons
  end

  # resources :companies do
  #   resources :branches do 
  #     resources :rewards
  #   end
  # end

end
