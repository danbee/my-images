MyImages::Application.routes.draw do
  root "home#index"

  resource :session, only: %i[new destroy]
  get "/auth/:provider/callback", to: "sessions#create", as: :create_session

  resource :user, only: [] do
    resources :images, only: %i[index show create destroy] do
      resources :tags, only: %i[create destroy]
    end
  end
end
