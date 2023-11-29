class HomeController < ApplicationController
  # before_action :getParams, only: [:accounts, :addAcounts]
  def dashboard
    # debugger
    puts "#{current_user.id}"
  end


  def wallet
  end
  private
  def getParams
    @account_number=params[:account_number]
    @bank_name=params[:bank_name]
    @account_type= params[:account_type]
  end
end
  