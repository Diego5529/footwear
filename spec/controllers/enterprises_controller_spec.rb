require 'spec_helper'

describe EnterprisesController do

  let(:valid_attributes) { {} }

  before :each do
    @enterprise = FactoryGirl.create(:enterprise)
  end

  describe "GET index" do
    context "when not logged" do
      it 'should redirect to login_user' do
        get :index
        response.should
      end
    end
  end

  describe "GET new" do
    it 'assigns a new object to the enterprise' do
      get :new
      assigns(:enterprise).should
    end
  end

  describe "new" do
    it "assigns all people as @people" do
     enterprise = Enterprise.new valid_attributes
     enterprise.should_not be_valid
    end
  end

   describe 'POST create' do
    it 'create enterprise with valid attributes' do
        post :create, enterprise: FactoryGirl.attributes_for(:enterprise)
        response.should_not render_template :new
      end
  end

  describe 'PUT Update' do
    # it 'located the requested enterprise' do
    #   login_user(@enterprise)
    #   put :update, id: @enterprise.id
    #   assigns(:enterprise).should eq @enterprise
    # end

    #  it 'changes the enterprise attributes' do
    #     login_user(@enterprise)
    #     put :update, { id: @enterprise, enterprise: { email: 'foo@bar.com' } }
    #     assigns(:enterprise).should eq @enterprise
    #   end

    context 'with invalid attributes' do
      it 'render the edit view' do
        put :update, { id: @enterprise, enterprise: { email: 'foo@bar.com' } }
        response.should_not be_success
      end
    end

      it 'should not changes the enterprise attributes' do
        put :update, { id: @enterprise, enterprise: {email: 'foo@bar.com', name: 'Empresa' } }
        @enterprise.reload
        @enterprise.name.should == 'Empresa'
      end
  end

  describe 'DELETE destroy' do

    it 'admin to deletes the enterprise' do
      login_user(@enterprise)
      expect{
        delete :destroy, id: @enterprise.id
      }.to change(Enterprise, :count).by(0)
    end

    it 'enterprise to not deletes the enterprise' do
      login_user(@enterprise)
      expect{
        delete :destroy, id: @enterprise.id
      }.to_not change(Enterprise, :count).by(-1)
    end

    it 'redirects to index' do
      login_user(@enterprise)
      delete :destroy, id: @enterprise
      response.should redirect_to "/people"
    end
  end
end