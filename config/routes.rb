# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :admin do
      resources :tournaments
      resources :teams
      resources :groups

      root to: "tournaments#index"
    end
  resources :teams, only: %i[index show], param: :short_name
  resources :tournaments, only: %i[index show]
end
