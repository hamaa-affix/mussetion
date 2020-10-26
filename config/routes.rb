Rails.application.routes.draw do
  root 'static_pages#home'
  #get 'controller#methods'
  get 'static_pages/home'
  get '/help_path', to: 'static_pages#help', as:'helf'
  get '/about_path', to: 'static_pages#about', as:'about'
  get '/contact_path', to: 'static_pages#contact', as:'contact'
  #anthor demo
  get '/boards', to:'boards#index', as:'boards_index'
  get '/boards/new', to: 'boards#new', as: 'boards_new'
  post 'boards', to: 'boards#create'
  # Roure::get('usl', 'controller@method_name');laravel
  # rootとすることでdefaultrootingの設定ができる。/ が来たらusersのindexControllerが呼び出されviewへ投げられる
  #root 'users#index'
  # resource rooting
  #root "hello#index"
end
