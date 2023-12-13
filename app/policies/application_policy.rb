# app/policies/application_policy.rb
class ApplicationPolicy
    attr_reader :user, :record
  
    def initialize(user, record)
      @user = user
      @record = record
    end
  
    def index?
      false
    end
  
    # Define other default behaviors as needed...
  end
  