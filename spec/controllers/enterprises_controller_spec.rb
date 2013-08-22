require 'spec_helper'

describe EnterprisesController do

  let(:valid_attributes) { { "name" => "MyString" } }
  let(:valid_session) { {} }

  before :each do
    @admin = FactoryGirl.create(:person)
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

  # describe 'PUT Update' do
  #   it 'located the requested client' do
  #     put :update, id: @enterprise
  #     assigns(:enterprise).should eq @enterprise
  #   end

  #    it 'changes the enterprise attributes' do
  #       login(@client)
  #       put :update, { id: @client, enterprise: { name: 'Test Foo' } }
  #       assigns(:enterprise).should eq @client
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
  def filtered_attributes(person)
    person.attributes.except("id","created_at","updated_at","password","admin")
  end

end