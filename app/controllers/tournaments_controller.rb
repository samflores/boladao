# frozen_string_literal: true

class TournamentsController < ApplicationController
  def index
    @tournaments = Tournament.all
  end

  def show
    @tournament = Tournament.includes(groups: :teams).find(params[:id])
    @matches = Match.where(tournament: @tournament)
  end
end
