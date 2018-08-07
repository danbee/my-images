MyImages::Application.routes.draw do
  root "home#index"

  resource :session, only: %i[new destroy]
  get "/auth/:provider/callback", to: "sessions#create", as: :create_session

  resource :user do
    resources :images
  end
end
