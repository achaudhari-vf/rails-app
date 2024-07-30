Rails.application.routes.draw do
 
  devise_for :users, path: '', path_names: {
    sign_in: 'login',
    sign_out: 'logout',
    registration: 'signup'
  },
  controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # post 'auth/token', to: 'tokens#create'
  namespace :api do
    namespace :v1 do
      resources :flights
      
      

      
    end
  end
  # root 'pages#home'
  # #resources :flights
  # get 'about', to:'pages#about'
  # get 'signup', to: 'users#new'

  # get 'login', to: 'sessions#new'
  # post 'login', to: 'sessions#create'
  # delete 'logout', to: 'sessions#destroy'
  

  # resources :users, :except => [:new]
end
