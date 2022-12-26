# frozen_string_literal: true

class TeamsController < ApplicationController
  def index
    @teams = Team.in_page(params[:p])
  end

  def show
    @team = Team.with_short_name(params[:short_name]).first
  end
end
