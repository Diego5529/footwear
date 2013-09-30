require 'spec_helper'

describe CategoriesController do

  let(:valid_attributes) { {} }

  before :each do
    @category = FactoryGirl.create(:category)
    @admin = FactoryGirl.create(:person)
  end

  # describe "GET index" do
  #   context "when not logged" do
  #     it 'should redirect to login' do
  #       get :index
  #       response.should redirect_to login_path
  #     end
  #   end
  # end


  # context "when not admin" do
  #     it 'should redirect to login again' do
  #       get :index
  #       response.should redirect_to login_path
  #   end
  # end

  # describe 'Show' do

  #   it 'should show admin' do
  #     login(@admin)
  #       get :show, id: @admin
  #       response.should be_success
  #   end

  #   it 'renders the show view' do
  #     login(@admin)
  #       get :show, id: @admin
  #       response.should render_template :show
  #   end

  #   context "when not admin" do
  #     it 'should redirect to login again' do
  #       get :show, id: @admin
  #       response.should redirect_to login_path
  #     end
  #   end
  # end
  
  # describe "GET new" do

  #   it 'assigns a new object to the person' do
  #       get :new
  #       assigns(:person).should
  #     end
  #   end

  # describe "new" do
  #   it "assigns all people as @people" do
  #     person = Person.new valid_attributes
  #     person.should_not be_valid
  #   end
  # end

  # describe 'POST create' do

  #   context 'with invalid attributes' do
  #     it 'render the new view' do
  #       put :new, { id: @admin, person: { name: 'Administrador' } }
  #       response.should_not be_success
  #     end
  #   end

  #   it 'create person with valid attributes' do
  #     post :create, person: FactoryGirl.attributes_for(:person)
  #     response.should
  #   end
  # end

  # describe 'PUT Update' do
  #   it 'changes the person attributes' do
  #     login(@admin)
  #     put :update, { id: @admin, person: { name: 'Test Foo' } }
  #     assigns(:person).should eq @admin
  #   end

  #   context 'with invalid attributes' do
  #     it 'render the edit view' do
  #       put :update, { id: @admin, person: { name: 'Administrador' } }
  #       response.should_not be_success
  #     end
  #   end

  #   it 'should not changes the person attributes' do
  #     put :update, { id: @admin, person: {name: 'foo@', name: 'Test Bar' } }
  #     @admin.reload
  #     @admin.name.should == 'Administrador'
  #   end

  #   it 'located the requested admin' do
  #   login(@admin)
  #     put :update, {id: @admin.id}, {id: @admin.id, admin: @admin.admin}
  #     assigns(:person).should eq @admin
  #   end

  #   it 'changes the admin attributes' do
  #     login(@admin)
  #     put :update, { id: @admin, person: { name: 'Administrador' } }
  #     assigns(:person).should eq @admin
  #   end
  # end

  # describe 'DELETE destroy' do

  #   it 'admin to deletes the person' do
  #     login(@admin)
  #     expect{
  #       delete :destroy, id: @admin.id}.to change(Person, :count).by(-1)
  #   end

  #   it 'person to not deletes the person' do
  #     login(@admin)
  #     expect{
  #       delete :destroy, id: @admin.id
  #     }.to_not change(Person, :count).by(0)
  #   end

  #   it 'redirects to index' do
  #     login(@admin)
  #     delete :destroy, id: @admin
  #     response.should redirect_to "/people"
  #   end
  # end
end