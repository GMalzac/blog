Rails.application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'
  devise_for :users
  get 'welcome/index'
  resources :articles do
    resources :comments
  end

  root 'articles#index'
end
