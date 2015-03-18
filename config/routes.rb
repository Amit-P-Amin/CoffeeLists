Rails.application.routes.draw do
  root to: "static_pages#root"

  namespace :api, defaults: { format: :json } do
    resources :items, only: [:create, :show, :index, :update]
  end
end
