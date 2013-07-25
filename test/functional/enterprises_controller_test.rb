require 'test_helper'

# class EnterprisesControllerTest < ActionController::TestCase
#   setup do
#     @enterprise = enterprises(:one)
#   end

#   test "should get index" do
#     get :index
#     assert_response :success
#     assert_not_nil assigns(:enterprises)
#   end

#   test "should get new" do
#     get :new
#     assert_response :success
#   end

#   test "should create enterprise" do
#     assert_difference('Enterprise.count') do
#       post :create, enterprise: { CEP: @enterprise.CEP, CNPJ: @enterprise.CNPJ, Telephone: @enterprise.Telephone, address: @enterprise.address, city: @enterprise.city, district: @enterprise.district, email: @enterprise.email, name: @enterprise.name, name_social: @enterprise.name_social, number: @enterprise.number, password: @enterprise.password, state: @enterprise.state }
#     end

#     assert_redirected_to enterprise_path(assigns(:enterprise))
#   end

#   test "should show enterprise" do
#     get :show, id: @enterprise
#     assert_response :success
#   end

#   test "should get edit" do
#     get :edit, id: @enterprise
#     assert_response :success
#   end

#   test "should update enterprise" do
#     put :update, id: @enterprise, enterprise: { CEP: @enterprise.CEP, CNPJ: @enterprise.CNPJ, Telephone: @enterprise.Telephone, address: @enterprise.address, city: @enterprise.city, district: @enterprise.district, email: @enterprise.email, name: @enterprise.name, name_social: @enterprise.name_social, number: @enterprise.number, password: @enterprise.password, state: @enterprise.state }
#     assert_redirected_to enterprise_path(assigns(:enterprise))
#   end

#   test "should destroy enterprise" do
#     assert_difference('Enterprise.count', -1) do
#       delete :destroy, id: @enterprise
#     end

#     assert_redirected_to enterprises_path
#   end
# end
