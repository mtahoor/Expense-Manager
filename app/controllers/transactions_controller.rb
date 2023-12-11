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
    if params[:transaction_type]==="Withdraw"
      begin
        ActiveRecord::Base.transaction do
          account = current_user.accounts.find(params[:account_id].to_i)
          if account.balance.to_i>=params[:Amount].to_i
            account.decrement(:balance,params[:Amount].to_i)
            account.save
            
          else
            raise ActiveRecord::Rollback , "Current balnce is low to withdraw the Amount"
          end
        end
      rescue=>e
        puts e.message
      end
    else
      begin
        ActiveRecord::Base.transaction do
          puts "bank-transfer case"
        end
      rescue=>e
        puts e.message
      end
    end
  end

  def expense
  end
  private
  def AllTranactions
    @transaction=current_user.transactions
  end
end
