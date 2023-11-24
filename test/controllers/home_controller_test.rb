require "test_helper"

class HomeControllerTest < ActionDispatch::IntegrationTest
  test "should get dashboard" do
    get home_dashboard_url
    assert_response :success
  end

  test "should get transactions" do
    get home_transactions_url
    assert_response :success
  end

  test "should get accounts" do
    get home_accounts_url
    assert_response :success
  end

  test "should get wallet" do
    get home_wallet_url
    assert_response :success
  end
end
