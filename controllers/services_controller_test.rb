require 'test_helper'

class ServicesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @service = services(:one)
  end

  test "should get index" do
    get services_url
    assert_response :success
  end

  test "should get new" do
    get new_service_url
    assert_response :success
  end

  test "should create service" do
    assert_difference('Service.count') do
      post services_url, params: { service: { hirer_id: @service.hirer_id, hirer_name: @service.hirer_name, service_price: @service.service_price, service_status: @service.service_status, service_type: @service.service_type, supplier_id: @service.supplier_id, supplier_name: @service.supplier_name } }
    end

    assert_redirected_to service_url(Service.last)
  end

  test "should show service" do
    get service_url(@service)
    assert_response :success
  end

  test "should get edit" do
    get edit_service_url(@service)
    assert_response :success
  end

  test "should update service" do
    patch service_url(@service), params: { service: { hirer_id: @service.hirer_id, hirer_name: @service.hirer_name, service_price: @service.service_price, service_status: @service.service_status, service_type: @service.service_type, supplier_id: @service.supplier_id, supplier_name: @service.supplier_name } }
    assert_redirected_to service_url(@service)
  end

  test "should destroy service" do
    assert_difference('Service.count', -1) do
      delete service_url(@service)
    end

    assert_redirected_to services_url
  end
end
