Rails.application.routes.draw do

  resources :articles
  root 'pages#home'  #controller+intialize method
  get 'about' , to:'pages#about'
  get 'signup', to:'users#new'
  resources :users, except: [:new]
end
