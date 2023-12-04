class Transaction < ApplicationRecord
    belongs_to :account, optional: true
    belongs_to :wallet, optional: true
    belongs_to :user
end