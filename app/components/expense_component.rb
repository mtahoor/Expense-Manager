# frozen_string_literal: true

class ExpenseComponent < ViewComponent::Base


    def initialize(user:)
        @income=user.expenses.all.order(created_at: :desc)
    end


end