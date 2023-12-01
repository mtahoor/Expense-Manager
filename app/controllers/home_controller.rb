class HomeController < ApplicationController
  def dashboard
    puts "#{current_user.id}"
  end


  def wallet
    @wallet=current_user.wallet
  end
end
  