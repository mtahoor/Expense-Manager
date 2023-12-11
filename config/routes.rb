Rails.application.routes.draw do
  get 'transactions/index'
  get 'transaction/create/income', to:'transactions#income'
  post 'transaction/create/income', to:'transactions#income_submit'
  get 'transaction/create/bankTransfer', to:'transactions#bankTransfer'
  post 'transaction/create/bankTransfer', to:'transactions#bankTransfer_submit'
  get 'transaction/create/expense', to:'transactions#expense' 
  post 'transaction/create/expense', to:'transactions#expense_create',as:'expense'  
  get 'accounts',to: 'accounts#index'
  get 'accounts/create', to:'accounts#create', as:'createAccount'
  post 'accounts/create', to:'accounts#create'
  delete 'accounts',to:'accounts#delete' , as:'deleteAccount'
  get 'accounts/update/:id', to: 'accounts#update'
  put 'accounts/update/:id', to: 'accounts#updated', as:'updateAccount'
  get 'transaction',to:'transactions#index'
  get 'wallet',to:'home#wallet'
  root to: "home#dashboard"
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_checkrai
  # Defines the root path route ("/") 
  # root "posts#index"
end
