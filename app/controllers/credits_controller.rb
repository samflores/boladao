# frozen_string_literal: true

class CreditsController < ApplicationController
  before_action :authenticate_user!

  def index
    @credits = Credits::ListUserCredits.new(user_id: current_user.id).call
  end

  def new
    @credit = Credit.new
    render :new
  end

  def create
    @credit = Credit.new(credit_params)

    buy_credits
  end

  private

  def credit_params
    params.require(:credit).permit(:amount)
  end

  def credit_card_params
    params.require(:credit).permit(:card_name, :card_number, :card_expiration, :cart_security_code)
  end

  def buy_credits
    Credits::BuyCredits.new(credit: @credit, user: current_user, credit_card: credit_card_params).call

    redirect_to credits_path
  rescue ::Credits::BuyCreditsError => e
    flash[:alert] = e.message
    redirect_to new_credit_path
  end
end
