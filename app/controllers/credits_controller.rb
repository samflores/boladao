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
    buy_credits = Credits::BuyCredits.new(credit: @credit, user: current_user)

    if buy_credits.call
      redirect_to credits_path
    else
      render :new
    end
  end

  private

  def credit_params
    params.require(:credit).permit(:amount)
  end
end
