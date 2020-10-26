Rails.application.routes.draw do
  get 'static_pages/home'
  get 'static_pages/help'
  get 'static_pages/about'
  root 'static_pages#home'
  # Roure::get('usl', 'controller@method_name');laravel
  # rootとすることでdefaultrootingの設定ができる。/ が来たらusersのindexControllerが呼び出されviewへ投げられる
  #root 'users#index'
  # resource rooting
  #root "hello#index"
end
