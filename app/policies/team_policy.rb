# frozen_string_literal: true

class TeamPolicy < ApplicationPolicy
  def show?
    user.admin?
  end
end
