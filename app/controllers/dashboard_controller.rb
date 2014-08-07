class DashboardController < ApplicationController

  def index
    @users = User.where.not(id: current_user.id)
    @pairing = Pairing.all
  end

end