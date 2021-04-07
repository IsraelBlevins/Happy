Rails.application.routes.draw do
  
  get 'data/index'
  get 'group/index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  # Defines the start page of the application
  root 'home#index'
end
