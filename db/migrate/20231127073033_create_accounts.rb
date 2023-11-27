class CreateAccounts < ActiveRecord::Migration[7.1]
  def change
    create_table :accounts do |t|
      t.string :bank_name
      t.string :account_number
      t.string :account_type
      t.integer :balance ,default:0

      t.timestamps
    end
    add_index :accounts, :account_number, unique: true
  end
end
