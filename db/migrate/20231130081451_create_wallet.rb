class CreateWallet < ActiveRecord::Migration[7.1]
  def change
    create_table :wallets do |t|
      t.integer :balance, default:0
      t.belongs_to :user, index:{ unique:true },foreign_key: true
      t.timestamps
    end
  end
end
