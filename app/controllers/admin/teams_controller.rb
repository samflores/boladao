module Admin
  class TeamsController < Admin::ApplicationController
    def show
      authorize requested_resource
    end

    def find_resource(param)
      Team.find_by!(short_name: param)
    end
  end
end
