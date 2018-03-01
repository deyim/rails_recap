Rails.application.routes.draw do
  devise_for :users
  root 'home#index'
  get 'home/index'
  # For details on available within this file, see http://guides.rubyonrails.org/routing.html
end
