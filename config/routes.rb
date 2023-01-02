# frozen_string_literal: true

Rails.application.routes.draw do
  resources :teams, only: %i[index show], param: :short_name
  resources :tournaments, only: %i[index show]
end
