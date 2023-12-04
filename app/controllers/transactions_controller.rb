class TransactionsController < ApplicationController
  before_action :AllTranactions,only: [:index]
  def index
    puts @transaction
  end

  def income
    @income=current_user.transactions.new
  end

  def bankTransfer
  end

  def expense
  end
  private
  def AllTranactions
    @transaction=current_user.transactions
  end
end
