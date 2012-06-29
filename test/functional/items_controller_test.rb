require 'test_helper'

class ItemsControllerTest < ActionController::TestCase
  setup do
    @item = items(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:items)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create item" do
    assert_difference('Item.count') do
      post :create, item: { animal_type: @item.animal_type, category: @item.category, city: @item.city, condition: @item.condition, datetime_posted: @item.datetime_posted, description: @item.description, estimated_value: @item.estimated_value, expiration_date: @item.expiration_date, image: @item.image, name: @item.name, state: @item.state, zip: @item.zip }
    end

    assert_redirected_to item_path(assigns(:item))
  end

  test "should show item" do
    get :show, id: @item
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @item
    assert_response :success
  end

  test "should update item" do
    put :update, id: @item, item: { animal_type: @item.animal_type, category: @item.category, city: @item.city, condition: @item.condition, datetime_posted: @item.datetime_posted, description: @item.description, estimated_value: @item.estimated_value, expiration_date: @item.expiration_date, image: @item.image, name: @item.name, state: @item.state, zip: @item.zip }
    assert_redirected_to item_path(assigns(:item))
  end

  test "should destroy item" do
    assert_difference('Item.count', -1) do
      delete :destroy, id: @item
    end

    assert_redirected_to items_path
  end
end
