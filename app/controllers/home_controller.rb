class HomeController < ApplicationController
  def dashboard

  end


  def wallet
    @wallet=current_user.wallet
  end
end
  