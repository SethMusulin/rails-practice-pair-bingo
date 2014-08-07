class PairingsController < ApplicationController

  def new
    @user = current_user
    @pairing = Pairing.new
    @partner = User.find(params[:user_id])
  end

  def create
    @partner = User.find(params[:pairing][:partner_id])
    @pairing = Pairing.new(user_id: current_user.id, partner_id: @partner.id, date:params[:pairing][:date])
    if @pairing.save
    redirect_to root_path
    else
      @user = current_user
      render :new
  end
end
end