Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  get '/questionnaire', to: 'pages#questionnaire'
  patch '/users/update', to: 'users#update'
end
