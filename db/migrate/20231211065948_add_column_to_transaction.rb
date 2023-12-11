class AddColumnToTransaction < ActiveRecord::Migration[7.1]
  def change
    add_column :transactions, :expense_type, :integer
  end
end
