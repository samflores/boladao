# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
	def new
		super do |resource|
			if params[:commit].present?
				resource.errors.add(:email, :invalid_authentication)
			end
		end
	end
end
