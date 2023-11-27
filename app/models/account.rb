class Account < ApplicationRecord
    validates :account_number ,presence: true,length: {minimum:11, maximum:30}
end