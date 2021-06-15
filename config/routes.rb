Rails.application.routes.draw do
  root 'pages#start'
  scope "(:locale)", locale: /en|vi/ do
    get'/home', to: 'pages#home'
    namespace :auth do
      get '/login', to: 'sessions#new'
      post '/login', to: 'sessions#create'
      delete '/logout', to: 'sessions#destroy'
      resources :users
    end
    get '/courses/:id/add-people', to: 'courses#add_people_view'
    post '/courses/:id/add-people', to: 'courses#add_people'
    put '/finish-task', to: 'tasks#finish_task'
    resources :courses
    resources :subjects
    resources :tasks
  end
end
