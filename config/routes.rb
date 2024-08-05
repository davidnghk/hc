require 'sidekiq/web'

Rails.application.routes.draw do

  resources :workflows
    resources :incidents
    resources :asset_incidents,    controller: 'incidents', type: 'AssetIncident' 
    resources :help_incidents,    controller: 'incidents', type: 'HelpIncident' 
    resources :house_incidents,    controller: 'incidents', type: 'HouseIncident'

    resources :tasks
    resources :help_tasks,    controller: 'tasks', type: 'HelpTask' 
    resources :house_tasks,     controller: 'tasks', type: 'HouseTask' 
    resources :request_tasks,    controller: 'tasks', type: 'RequestTask' 
    resources :repair_tasks,     controller: 'tasks', type: 'RepairTask' 
    resources :locations
    resources :slopes,    controller: 'locations', type: 'Slope' 
    resources :rooms,     controller: 'locations', type: 'Room' 
    resources :fixes
    resources :issues
    resources :sw_issues,    controller: 'issues', type: 'SwIssue' 
    resources :other_issues, controller: 'issues', type: 'OtherIssue' 

    namespace :admin do
        resources :users
        resources :announcements
        resources :notifications
        resources :services

        root to: "users#index"
      end
    get '/privacy', to: 'home#privacy'
    get '/terms', to: 'home#terms'
    resources :notifications, only: [:index]
    resources :announcements, only: [:index]
    authenticate :user, lambda { |u| u.admin? } do
      mount Sidekiq::Web => '/sidekiq'
    end

    devise_for :users, controllers: { omniauth_callbacks: "users/omniauth_callbacks" }
    get 'auth/:provider/callback', to: 'sessions#create'
    get  'auth/failure', to: redirect('/')
    get 'signout', to: 'sessions#destroy', as: 'signout'
    root to: 'home#index'
    # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end
