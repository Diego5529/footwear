require 'test_helper'

class PublicsControllerTest < ActionController::TestCase
  setup do
    @public = publics(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:publics)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create public" do
    assert_difference('Public.count') do
      post :create, public: {  }
    end

    assert_redirected_to public_path(assigns(:public))
  end

  test "should show public" do
    get :show, id: @public
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @public
    assert_response :success
  end

  test "should update public" do
    put :update, id: @public, public: {  }
    assert_redirected_to public_path(assigns(:public))
  end

  test "should destroy public" do
    assert_difference('Public.count', -1) do
      delete :destroy, id: @public
    end

    assert_redirected_to publics_path
  end
end
