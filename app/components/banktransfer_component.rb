# frozen_string_literal: true

class BanktransferComponent < ViewComponent::Base


    def initialize(user:)
        @income=user.bank_transfers.all
    end

end
