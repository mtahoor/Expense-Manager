# frozen_string_literal: true

class BanktransferComponent < ViewComponent::Base


    def initialize(user:)
        @income=user.bank_transfers.all.order(created_at: :desc)
    end

end
