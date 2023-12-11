class Transaction < ApplicationRecord
    enum :expense_type, [:FoodAndDrinks,:Transportation,:Accommodation,:Shopping,:Entertainment], default: :nil 
    belongs_to :account, optional: true
    belongs_to :wallet, optional: true
    belongs_to :user
end