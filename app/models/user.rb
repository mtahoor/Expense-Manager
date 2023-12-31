class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :accounts
  has_one :wallet
  has_many :transactions
  has_many :incomes 
  has_many :bank_transfers
  has_many :expenses
end
