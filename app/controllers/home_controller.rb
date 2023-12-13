class HomeController < ApplicationController
  def dashboard
   @pie_chart_data = {
  "Income to Accounts": current_user.incomes.where('created_at > ?', 30.days.ago).where(wallet_id:nil).sum(:Amount),
  "Income to Wallets": current_user.incomes.where('created_at > ?', 30.days.ago).where(account_id:nil).sum(:Amount),
  "Outgoing Expenses": current_user.expenses.where('created_at > ?', 30.days.ago).sum(:Amount),
  "Bank Transfer":current_user.bank_transfers.where('created_at > ?', 30.days.ago).sum(:Amount),
}
  end


  def wallet
    @wallet=current_user.wallet
  end
end
  