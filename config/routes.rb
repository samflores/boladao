# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations', sessions: 'users/sessions' }

  root to: 'teams#index'

  namespace :admin do
    resources :tournaments
    resources :teams
    resources :groups
    resources :matches
    resources :users, only: %i[index show]

    root to: 'tournaments#index'
  end
  resources :teams, only: %i[index show], param: :short_name
  resources :tournaments, only: %i[index show]
  resources :bets, only: %i[index]
  resources :credits, only: %i[index new create]
end
