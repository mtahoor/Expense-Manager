class AccountsController < ApplicationController
  include Pundit
  def index
    @accounts=current_user.accounts.all
    authorize  @accounts
  end

  def create
    if request.post?
      @account=current_user.accounts.new(getParams)
      authorize @account
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
    @account=Account.find(params[:id])
    if @account.update(getAccParams)
      redirect_to '/accounts'
    else
      flash[:alert]=@account.errors
    end
  end

  def delete
    begin
      Account.destroy_by(id:params[:id])
      flash[:alert]="Account Deleted Successfully"
      redirect_to '/accounts'
    rescue=>e
      flash[:alert]="Account can't be deleted Cause it have some transactions"
      redirect_to '/accounts'
    end
  end


  private
  def getParams
    params.permit(:bank_name, :account_type, :account_number)
  end
  def getAccParams
    params.require(:account).permit(:bank_name, :account_type, :account_number)
  end
end
