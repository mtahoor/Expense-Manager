Rails.application.routes.draw do
  get 'transaction',to:'home#transactions'
  get 'accounts',to:'home#accounts'
  delete 'accounts',to:'home#accounts'
  put 'accounts',to:'home#accounts'
  get 'wallet',to:'home#wallet'
  get 'addAccounts',to:'home#addAcounts'
  post 'addAccounts',to:'home#addAcounts'
  root to: "home#dashboard"
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_checkrai
  # Defines the root path route ("/") 
  # root "posts#index"
end
