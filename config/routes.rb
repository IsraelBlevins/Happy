Rails.application.routes.draw do
  get 'home/index/:uid/:desired_date' => 'home#index', as: :home_index

  get 'data/index'
  get 'group/index'
  get 'homework/index'
  get 'sessions/new' => 'sessions#new'

  post '/create' => 'home#create'
  post '/createQuestion' => 'home#createQuestion'
  post '/createMoodRating' => 'home#createMoodRating'
  post '/createSliderPicture' => 'home#createSliderPicture'

  post 'createHW' => 'homework#createHW'
  post 'createVideo' => 'homework#createVideo'

  patch '/updateMoodRating' => 'home#updateMoodRating'
  patch '/update' => 'home#update'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :members do
    resources :comments
  end

  resources :comments, only: [:destroy]

  resources :homework, only: [:destroy]
  delete 'destroyVideo/:id' => 'homework#destroyVideo'
  
  resources :home, only: [:destroy]
  delete 'destroyCheckBox/:id' => 'home#destroyCheckBox'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  root 'sessions#new'
end
