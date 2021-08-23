Rails.application.routes.draw do

  resources :articles
  root 'pages#home'  #controller+intialize method
  get 'about' , to:'pages#about'
end
