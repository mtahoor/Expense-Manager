class HomeController < ApplicationController
  def dashboard
    puts "#{current_user.id}"
  end

  def transactions
  end

  def accounts
    if request.delete?
      @account_number=params[:account_number]
      Account.destroy_by(account_number:@account_number)
      flash[:alert]='Account Deleted Successfully'
      redirect_to action: "accounts"
    end
      if request.put?
      flash[:alert]='put Method called successfully'
      redirect_to action: "accounts"
    end
    @accounts=Account.where(users_id:current_user.id)
  end

  def addAcounts
    if request.post?
      @bank_name=params[:bank_name]
      @account_type= params[:account_type]
      @account_number=params[:account_number]
      @account = Account.new(
      bank_name: @bank_name,
      account_type: @account_type,
      account_number: @account_number,
      users_id:current_user.id
      )
      
      if @account.save
          flash[:alert]='Account is saved'
          redirect_to action: "accounts"
      else
        flash.now[:alert] = @account.errors
        flash.discard
        redirect_to '/addAcounts'
      end
    end
  end
  
  def wallet
  end
end
