require 'test_helper'

class BudgetsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @budget = budgets(:one)
  end

  test "should get index" do
    get budgets_url
    assert_response :success
  end

  test "should get new" do
    get new_budget_url
    assert_response :success
  end

  test "should create budget" do
    assert_difference('Budget.count') do
      post budgets_url, params: { budget: { budget_price: @budget.budget_price, budget_status: @budget.budget_status, hirer_id: @budget.hirer_id, hirer_name: @budget.hirer_name, requested_service: @budget.requested_service, supplier_id: @budget.supplier_id, supplier_name: @budget.supplier_name } }
    end

    assert_redirected_to budget_url(Budget.last)
  end

  test "should show budget" do
    get budget_url(@budget)
    assert_response :success
  end

  test "should get edit" do
    get edit_budget_url(@budget)
    assert_response :success
  end

  test "should update budget" do
    patch budget_url(@budget), params: { budget: { budget_price: @budget.budget_price, budget_status: @budget.budget_status, hirer_id: @budget.hirer_id, hirer_name: @budget.hirer_name, requested_service: @budget.requested_service, supplier_id: @budget.supplier_id, supplier_name: @budget.supplier_name } }
    assert_redirected_to budget_url(@budget)
  end

  test "should destroy budget" do
    assert_difference('Budget.count', -1) do
      delete budget_url(@budget)
    end

    assert_redirected_to budgets_url
  end
end
