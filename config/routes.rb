Rails.application.routes.draw do
  root 'static_pages#home'
  #get 'controller#methods'
  get 'static_pages/home'
  get '/help_path', to: 'static_pages#help', as:'helf'
  get '/about_path', to: 'static_pages#about', as:'about'
  get '/contact_path', to: 'static_pages#contact', as:'contact'
  #anthor demo
  # get '/boards', to:'boards#index', as:'boards_index'
  # get '/boards/new', to: 'boards#new', as: 'boards_new'
  # post 'boards', to: 'boards#create'
  # get 'boards/:id', to: 'boards#show', as: 'boards_show'

  #onlyを付与することで作成したコントローラーメソッドのみrestしてくれる
  resources :boards, only: [:index, :new, :create, :show]
end
