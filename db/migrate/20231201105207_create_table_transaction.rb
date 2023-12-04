class CreateTableTransaction < ActiveRecord::Migration[7.1]
  def change
    create_table :transactions do |t|
      t.integer :amount
      t.date :date
      t.string :note
      t.string :type
      t.belongs_to :user ,foreign_key:true, null:false
      t.belongs_to :account, foreign_key:true, null: true
      t.belongs_to :wallet, foreign_key:true, null: true
      t.timestamps
    end
  end
end
