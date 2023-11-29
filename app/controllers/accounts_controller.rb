class AccountsController < ApplicationController
  def index
    @accounts=current_user.accounts.all
  end

  def create
    if request.post?
      @account=current_user.accounts.new(getParams)
      if @account.save
        redirect_to '/accounts'
      else
        puts @account.errors[:account_number]
        flash[:alert]=@account.errors
        redirect_to '/createAccount'
      end
    end
  end

  def update
    @account=current_user.accounts.find(params[:id])
  end

  def updated
    puts @account
  end

  def delete
    Account.destroy_by(id:params[:id])
    flash[:alert]="Account Deleted Successfully"
    redirect_to '/accounts'
  end


  private
  def getParams
    params.permit(:bank_name, :account_type, :account_number)
  end
end
