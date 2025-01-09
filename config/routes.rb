Rails.application.routes.draw do
  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  root "projects#index"

  resource :session, only: [ :new, :create, :destroy ]
  resource :registration, only: [ :new, :create ]

  resources :projects do
    scope module: "projects" do
      resource :status_change, only: [:create]
    end

    resources :comments, shallow: true
  end
end
