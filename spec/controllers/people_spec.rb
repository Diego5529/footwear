require 'spec_helper'

describe PeopleController do

  # This should return the minimal set of attributes required to create a valid
  # Person. As you add validations to Person, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) { { "name" => "MyString" } }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # PeopleController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  before :each do
    @admin = FactoryGirl.create(:person)
    @client = FactoryGirl.create(:client)
    @enterprise = FactoryGirl.create(:enterprise)
  end

   describe "GET index" do
    context "when not logged" do
      it 'should redirect to login' do
        get :index
        response.should redirect_to login_path
      end
    end
  end


   describe "GET new" do
  it 'assigns a new object to the person' do
      get :new
      assigns(:person).should
    end
  end

  #  describe 'POST create' do
  #   it 'create person with valid attribute' do
  #       match :create, person: FactoryGirl.attributes_for(:person)
  #       response.should render_template :new
  #     end
  # end


  # context 'with invalid attributes' do
  #     it 'render the edit view' do
  #       put :update, { id: @person, person: { name: 'Test Bar' } }
  #       response.should_not be_success
  #     end
  #   end

  #     it 'should not changes the person attributes' do
  #       put :update, { id: @person, person: { name: 'Test Bar' } }
  #       @person.reload
  #       @person.name.should == 'Client'
  #     end

  describe "new" do
    it "assigns all people as @people" do
     person = Person.new valid_attributes
     person.should_not be_valid
    end
  end

  describe "new" do
    it "assigns all people as @people" do
     person = Person.new valid_attributes
     person.should_not be_valid
    end
  end

  private
  def filtered_attributes(person)
    person.attributes.except("id","created_at","updated_at","password","admin")
  end

end
