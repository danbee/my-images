Rails.application.routes.draw do
  root "home#index"

  resource :session, only: %i[new destroy]
  get "/auth/:provider/callback", to: "sessions#create", as: :create_session

  resources :images, only: %i[index show create destroy] do
    resources :tags, only: %i[create destroy]
  end

  resources :albums, only: %i[index create destroy] do
    resources :images, only: %i[index]
  end
end
