require 'test_helper'

class HirersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @hirer = hirers(:one)
  end

  test "should get index" do
    get hirers_url
    assert_response :success
  end

  test "should get new" do
    get new_hirer_url
    assert_response :success
  end

  test "should create hirer" do
    assert_difference('Hirer.count') do
      post hirers_url, params: { hirer: { address: @hirer.address, name: @hirer.name } }
    end

    assert_redirected_to hirer_url(Hirer.last)
  end

  test "should show hirer" do
    get hirer_url(@hirer)
    assert_response :success
  end

  test "should get edit" do
    get edit_hirer_url(@hirer)
    assert_response :success
  end

  test "should update hirer" do
    patch hirer_url(@hirer), params: { hirer: { address: @hirer.address, name: @hirer.name } }
    assert_redirected_to hirer_url(@hirer)
  end

  test "should destroy hirer" do
    assert_difference('Hirer.count', -1) do
      delete hirer_url(@hirer)
    end

    assert_redirected_to hirers_url
  end
end
