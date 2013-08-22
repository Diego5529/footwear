require 'spec_helper'

describe ClientsController do

  let(:valid_attributes) { { "email" => "MyString" } }
  let(:valid_attributes) { { "plain_password" => "123456"} } 
  let(:valid_session) { {} }

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
    it "assigns all people as @people" do
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

  # describe 'PUT Update' do
  #   it 'located the requested client' do
  #     put :update, id: @client
  #     assigns(:client).should eq @client
  #   end

  #    it 'changes the client attributes' do
  #       login(@client)
  #       put :update, { id: @client, client: { name: 'Test Foo' } }
  #       assigns(:client).should eq @client
  #     end

  #   context 'with invalid attributes' do
  #     it 'render the edit view' do
  #       put :update, { id: @client, client: { email: 'foo@' } }
  #       response.should_not be_success
  #     end
  #   end

  #     it 'should not changes the person attributes' do
  #       put :update, { id: @person, client: {email: 'foo@', name: 'Test Bar' } }
  #       @client.reload
  #       @client.name.should == 'Client'
  #     end
  # end



  describe 'DELETE destroy' do

    # it 'admin to deletes the person' do
    #   #logged(@person)
    #   expect{
    #     delete :destroy, id: @person.id
    #   }.to change(Person, :count).by(-1)
    # end

    # it 'person to not deletes the person' do
    #   #logged(@person)
    #   expect{
    #     delete :destroy, id: @person.id
    #   }.to_not change(Person, :count).by(-1)
    # end

    # it 'redirects to index' do
    #   #logged(@person)
    #   delete :destroy, id: @people
    #   response.should redirect_to :index
    # end
  end

  private
  def filtered_attributes(client)
    client.attributes.except("id","created_at","updated_at","password")
  end

end