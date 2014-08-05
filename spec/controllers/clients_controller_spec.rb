require 'spec_helper'

describe ClientsController do

  let(:valid_attributes) { {} }

  before :each do
    @admin = FactoryGirl.create(:person)
    @client = FactoryGirl.create(:client)
  end

  describe "GET index" do
    context "when not logged" do
      it 'should redirect to login' do
        get :index
        response.should
      end
    end
  end

  describe 'Show' do

    it 'should show admin' do
      login(@admin)
        get :show, id: @client
        response.should be_success
    end

    it 'renders the show view' do
      login(@client)
        get :show, id: @client
        response.should render_template :show
    end

    context "when not admin" do
      it 'should redirect to login again' do
        get :show, id: @client
        response.should redirect_to people_path
      end
    end
  end

  describe "GET new" do
    it 'assigns a new object to the client' do
      get :new
      assigns(:client).should
    end
  end

  describe "new" do
    it "assigns all client as @client" do
     client = Client.new valid_attributes
     client.should_not be_valid
    end
  end

  describe 'POST create' do
    it 'create client with invalid attributes' do
      post :create, client: FactoryGirl.attributes_for(:client)
      response.should_not render_template :new
    end

    it 'should create client' do
    login(@admin)
      @new_client = Client.new(@client.attributes.except("id", "created_at","updated_at"))
      @new_client.name = "NewClient"
      should_not eq('Client.count') do
        post :create, client: { name: @client.name}
      end
      response.should be_success
    end
  end

  describe 'PUT Update' do
    it 'located the requested client' do
      login(@admin)
      put :update, id: @client
      assigns(:client).should eq @client
    end

     it 'changes the client attributes' do
        login(@admin)
        put :update, { id: @client, client: { name: 'Usuario' } }
        assigns(:client).should eq @client
      end

    context 'with invalid attributes' do
      it 'render the edit view' do
        put :update, { id: @client, client: { email: 'foo@bar' } }
        response.should_not be_success
      end
    end

      it 'should not changes the client attributes' do
        put :update, { id: @client, client: {email: 'foo@bar', name: 'Cliente' } }
        @client.reload
        @client.name.should == 'Usuario'
      end
  end

  describe 'DELETE destroy' do

    it 'admin to deletes the client' do
      login_client(@client)
      expect{
        delete :destroy, id: @client.id
      }.to change(Client, :count).by(0)
    end

    it 'client to not deletes the client' do
      login_client(@client)
      expect{
        delete :destroy, id: @client.id
      }.to_not change(Client, :count).by(-1)
    end

    it 'redirects to index' do
      login_client(@client)
      delete :destroy, id: @client
      response.should redirect_to "/people"
    end
  end
end