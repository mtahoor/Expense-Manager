class AddReferenceAccountsToUser < ActiveRecord::Migration[7.1]
  def change
    add_reference :accounts, :users, null: false, foreign_key: true
  end
end
