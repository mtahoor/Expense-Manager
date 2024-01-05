# frozen_string_literal: true

class IncomeComponent < ViewComponent::Base

    def initialize(user:)
        @income=user.incomes.all.order(created_at: :desc)
    end

end
