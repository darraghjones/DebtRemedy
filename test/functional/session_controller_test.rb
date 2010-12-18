require 'test_helper'

class SessionControllerTest < ActionController::TestCase
  test "should get new" do
    get :new
    assert_response :success
  end

  test "should get create" do
    get :create
    assert_response :success
  end

  test "should get update" do
    get :update
    assert_response :success
  end

  test "should get qaq" do
    get :qaq
    assert_response :success
  end

  test "should get about_you" do
    get :about_you
    assert_response :success
  end

  test "should get your_income" do
    get :your_income
    assert_response :success
  end

  test "should get priority" do
    get :priority
    assert_response :success
  end

  test "should get other_expenses" do
    get :other_expenses
    assert_response :success
  end

  test "should get living_expenses" do
    get :living_expenses
    assert_response :success
  end

  test "should get assets" do
    get :assets
    assert_response :success
  end

  test "should get who_you_owe" do
    get :who_you_owe
    assert_response :success
  end

  test "should get last_not_least" do
    get :last_not_least
    assert_response :success
  end

  test "should get please_wait" do
    get :please_wait
    assert_response :success
  end

  test "should get recommendation" do
    get :recommendation
    assert_response :success
  end

  test "should get remedy" do
    get :remedy
    assert_response :success
  end

  test "should get email_booklet" do
    get :email_booklet
    assert_response :success
  end

  test "should get your_details" do
    get :your_details
    assert_response :success
  end

  test "should get logout" do
    get :logout
    assert_response :success
  end

  test "should get closure" do
    get :closure
    assert_response :success
  end

end
