require 'test_helper'

class ShoesControllerTest < ActionController::TestCase
  setup do
    @shoe = shoes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:shoes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create shoe" do
    assert_difference('Shoe.count') do
      post :create, shoe: { audience: @shoe.audience, description: @shoe.description, enterprise_id: @shoe.enterprise_id, name: @shoe.name, promotion: @shoe.promotion, registed: @shoe.registed, stock: @shoe.stock, value: @shoe.value }
    end

    assert_redirected_to shoe_path(assigns(:shoe))
  end

  test "should show shoe" do
    get :show, id: @shoe
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @shoe
    assert_response :success
  end

  test "should update shoe" do
    put :update, id: @shoe, shoe: { audience: @shoe.audience, description: @shoe.description, enterprise_id: @shoe.enterprise_id, name: @shoe.name, promotion: @shoe.promotion, registed: @shoe.registed, stock: @shoe.stock, value: @shoe.value }
    assert_redirected_to shoe_path(assigns(:shoe))
  end

  test "should destroy shoe" do
    assert_difference('Shoe.count', -1) do
      delete :destroy, id: @shoe
    end

    assert_redirected_to shoes_path
  end
end
