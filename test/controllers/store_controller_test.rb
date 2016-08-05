require 'test_helper'

class StoreControllerTest < ActionDispatch::IntegrationTest
  test "should get products" do
    get store_products_url
    assert_response :success
  end

  test "should get contact" do
    get store_contact_url
    assert_response :success
  end

  test "should get single" do
    get store_single_url
    assert_response :success
  end

  test "should get typo" do
    get store_typo_url
    assert_response :success
  end

end
