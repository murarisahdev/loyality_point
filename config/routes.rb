require "sidekiq/web"

Rails.application.routes.draw do
  mount Sidekiq::Web => "/sidekiq"
  devise_for :users

  resources :invoices, only: %i(new create index)
  root to: redirect("/invoices")
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
