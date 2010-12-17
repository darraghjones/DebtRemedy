require 'test_helper'

class DataItemsControllerTest < ActionController::TestCase
  setup do
    @data_item = data_items(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:data_items)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create data_item" do
    assert_difference('DataItem.count') do
      post :create, :data_item => @data_item.attributes
    end

    assert_redirected_to data_item_path(assigns(:data_item))
  end

  test "should show data_item" do
    get :show, :id => @data_item.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @data_item.to_param
    assert_response :success
  end

  test "should update data_item" do
    put :update, :id => @data_item.to_param, :data_item => @data_item.attributes
    assert_redirected_to data_item_path(assigns(:data_item))
  end

  test "should destroy data_item" do
    assert_difference('DataItem.count', -1) do
      delete :destroy, :id => @data_item.to_param
    end

    assert_redirected_to data_items_path
  end
end
