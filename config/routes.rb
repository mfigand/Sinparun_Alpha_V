Rails.application.routes.draw do

  devise_for :users
  devise_for :companies

  root to: "site#home"
  
  get '/api_sinparun/nike', to: 'site#activity_user_nike'
  get '/api_sinparun/runtastic', to: 'site#activity_user_runtastic'

  get '/users/sync_account/nike', to: 'users#sync_account_nike'
  get '/users/sync_account/runtastic', to: 'users#sync_account_runtastic'

  resources :users do
    resources :races, :coupons
  end

  resources :companies do
    resources :branches do 
      resources :rewards, :employees
    end
  end

end
