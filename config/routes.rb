Rails.application.routes.draw do
	root to: 'home#top'
	get 'home/about'
	get 'book_comments/index'
	devise_for :users
	resources :users,only: [:show,:index,:edit,:update]
	resources :books do
		resource :favorites, only: [:create, :destroy]
		resources :book_comments, only: [:index, :create, :destroy]
	end
end
