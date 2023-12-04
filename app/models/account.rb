class Account < ApplicationRecord
    validates :account_number ,presence: true,length: {minimum:11, maximum:30}, uniqueness: true
    validates :bank_name ,presence: true,length: {minimum:3,maximum:100}
    validates :account_type ,presence: true,length: {minimum:3,maximum:100}
    belongs_to :user
    has_many :transactions
end