require 'spec_helper'

describe ClientsController do

  let(:valid_attributes) { {} }

  before :each do
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
  end

  describe 'PUT Update' do
    # it 'located the requested client' do
    #   login_client(@client)
    #   put :update, id: @client
    #   assigns(:client).should eq @client
    # end

    #  it 'changes the client attributes' do
    #     login_client(@client)
    #     put :update, { id: @client, client: { name: 'Usuario' } }
    #     assigns(:client).should eq @client
    #   end

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

  private
  def filtered_attributes(client)
    client.attributes.except("id","created_at","updated_at","password")
  end
end