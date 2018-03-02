Rails.application.routes.draw do
	root 'memos#index'
	resources :memos do
		resources :comments, only: [:create, :destroy]
 	end
#  get '/memos/new', to: 'memos#new', as 'new_memo'
#  post '/memos', to: 'memos#create'

#  get '/memos/:id', to: 'memos#show'
#  get '/memos', to: 'memos#index'

#  get 'memos/:id/edit'
#  patch 'memos/:id'

#  delete 'memos/:id'

  devise_for :users
  root 'home#index'
  get 'home/index'
  # For details on available within this file, see http://guides.rubyonrails.org/routing.html
end
