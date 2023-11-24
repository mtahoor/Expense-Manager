class HomeController < ApplicationController
  def dashboard
    puts "#{current_user.id}"
  end

  def transactions
  end

  def accounts
  end

  def wallet
  end
end
