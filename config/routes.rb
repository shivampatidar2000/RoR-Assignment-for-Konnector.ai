Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

  # Defines the root path route ("/")
  # root "posts#index"
  namespace :admin do
    resources :create_admin, only: [ :create ]
    resources :schools, only: [ :create ]
    post "create_school_admin", to: "users#create_school_admin"
  end

  namespace :login do
    resources :login, only: [ :create ]
  end

  namespace :school_admins do
    resources :schools, only: [ :update ]
    resources :courses, only: [ :create ]
    resources :batches, only: [ :create ]
    resources :enrollments, only: [ :update ]
  end

  namespace :students do
    resources :enrollments, only: [ :create ]
    get "batches/:id/classmates", to: "batches#classmates"
    resources :progress, only: [ :index ]
    resources :student_create, only: [ :create ]
  end
end
