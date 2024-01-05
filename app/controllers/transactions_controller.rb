class TransactionsController < ApplicationController
  before_action :AllTranactions,only: [:index]
  def index
    # puts @transaction
  end

  def income
    @transaction=current_user.transactions.new
    @accounts=current_user.accounts.all
  end

  def income_submit
    if params[:transaction_type]==="Wallet"
      begin
        ActiveRecord::Base.transaction do
          current_user.incomes.create(wallet_id:current_user.wallet.id,amount:params[:Amount],date:params[:Date],note:params[:Note])
          current_user.wallet.increment(:balance, params[:Amount].to_i)
          current_user.wallet.save
          redirect_to action: "index"
        end
      rescue=>e
        puts e.message
      end
    else
      begin
        ActiveRecord::Base.transaction do
          current_user.incomes.create(account_id:params[:account_id],amount:params[:Amount],date:params[:Date],note:params[:Note])
          account = current_user.accounts.find(params[:account_id].to_i)
          account.increment(:balance, params[:Amount].to_i)
          account.save
          redirect_to action: "index"
        end
      rescue=>e
        puts e.message
      end
    end
  end

  def bankTransfer
    @transaction=current_user.transactions.new
    @accounts=current_user.accounts.all
  end

  def bankTransfer_submit
      begin
        ActiveRecord::Base.transaction do
          account = current_user.accounts.find(params[:account_id].to_i)
          if account.balance.to_i>=params[:Amount].to_i
            account.decrement(:balance,params[:Amount].to_i)
            account.save
            current_user.bank_transfers.create(account_id:params[:account_id],amount:params[:Amount],date:params[:Date],note:params[:Note])
            if params[:transaction_type]==="Bank-Transfer"
              if params[:account_id]===params[:account_id_r]
                flash[:alert]="Cannot transfer money between one account"
                redirect_to action: "bankTransfer"
                raise ActiveRecord::Rollback , "Cannot transfer money between one account"
              end
              current_user.incomes.create(account_id:params[:account_id_r],amount:params[:Amount],date:params[:Date],note:"Amount Recived From #{account.bank_name} #{account.account_number}")
              recevier_account = current_user.accounts.find(params[:account_id_r].to_i)
              recevier_account.increment(:balance, params[:Amount].to_i)
              recevier_account.save
            end
            redirect_to action: "index"   
          else
            flash[:alert]="Current balnce is low to withdraw the Amount"
            redirect_to action: "bankTransfer"
            raise ActiveRecord::Rollback , "Current balnce is low to withdraw the Amount"
            
          end
        end
      rescue=>e
        puts e.message
      end
  end

  def expense
    @expense=current_user.expenses.new  
    @accounts=current_user.accounts.all
  end



  def expense_create
    begin
      p=params[:expense]
      ActiveRecord::Base.transaction do
        if p[:paid_with]==='Account'
          account = current_user.accounts.find(p[:account_id].to_i)
          if account.balance.to_i>=p[:Amount].to_i
            account.decrement(:balance,p[:Amount].to_i)
            account.save
            current_user.expenses.create(account_id:p[:account_id],amount:p[:Amount],date:p[:Date],note:p[:Note],expense_type:p[:expense_type])
            redirect_to action: "index"
          else
            flash[:alert]="Account balnce is low to pay the expense Amount"
            redirect_to action: "expense"
          end
        elsif p[:paid_with]==="Wallet"
          if current_user.wallet.balance>=p[:Amount].to_i 
            wallet=current_user.wallet.decrement(:balance,p[:Amount].to_i)
            wallet.save
            current_user.expenses.create(wallet_id:wallet.id,amount:p[:Amount],date:p[:Date],note:p[:Note],expense_type:p[:expense_type])
            redirect_to action: "index"
          else
            flash[:alert]="Wallet balnce is low to pay the expense Amount"
            redirect_to action: "expense"  
          end
        end
      end
    rescue=>e
      flash[:alert]=e.message
    end
  end




  private
  def AllTranactions
    @transaction=current_user.transactions.order(created_at: :desc)
  end
end
