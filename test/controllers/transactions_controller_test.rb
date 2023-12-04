require "test_helper"

class TransactionsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get transactions_index_url
    assert_response :success
  end

  test "should get index" do
    get transactions_index_url
    assert_response :success
  end

  test "should get income" do
    get transactions_income_url
    assert_response :success
  end

  test "should get bank-transfer" do
    get transactions_bank-transfer_url
    assert_response :success
  end

  test "should get expense" do
    get transactions_expense_url
    assert_response :success
  end
end
