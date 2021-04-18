Rails.application.routes.draw do
  
  get 'data/index'
  get 'group/index'
  get 'homework/index'
  get 'sessions/new' => 'sessions#new'
  get 'home/index' => 'home#index'

  post '/create' => 'home#create'
  post '/createQuestion' => 'home#createQuestion'
  post '/createMoodRating' => 'home#createMoodRating'
  post '/createSliderPicture' => 'home#createSliderPicture'

  post 'createHW' => 'homework#createHW'
  post 'createVideo' => 'homework#createVideo'

  patch '/updateMoodRating' => 'home#updateMoodRating'
  patch '/update' => 'home#update'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users do
    resources :comments
  end

  resources :comments, only: [:destroy]

  resources :homework, only: [:destroy]
  resources :home, only: [:destroy]
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  root 'sessions#new'
end
