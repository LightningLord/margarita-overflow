Project::Application.routes.draw do

  root to: 'pages#welcome'
  devise_for :users, controllers: { omniauth_callbacks: "omniauth_callbacks" }

  resources :answers
  resources :questions

end
