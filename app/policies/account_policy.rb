class AccountPolicy < ApplicationPolicy

  def create?
    user.present? && record.user == user
  end

  def update?
    user.present? && record.user == user
  end

  def destroy?
    user.present? && record.user == user
  end
  def index?
    user.present?
  end
end
