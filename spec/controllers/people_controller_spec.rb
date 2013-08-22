require 'spec_helper'

describe PeopleController do

  let(:valid_attributes) { {} }
  let(:valid_attributes) { {} }
  let(:valid_session) { {} }

  before :each do
    @admin = FactoryGirl.create(:person)
  end

   describe "GET index" do
    context "when not logged" do
      it 'should redirect to login' do
        get :index
        response.should redirect_to login_path
      end
    end
  end

  context "when not admin" do
      it 'should redirect to login again' do
        get :index
        response.should redirect_to login_path
    end
  end

  describe "GET new" do

    it 'assigns a new object to the person' do
        get :new
        assigns(:person).should
      end
    end

  describe "new" do
    it "assigns all people as @people" do
      person = Person.new valid_attributes
      person.should_not be_valid
    end
  end

  describe 'POST create' do
    it 'create person with valid attributes' do
      post :create, person: FactoryGirl.attributes_for(:person)
      response.should
    end
  end

  # describe 'DELETE destroy' do

  #   it 'admin to deletes the person' do
  #     logged(@person)
  #     expect{
  #       delete :destroy, id: @person.id}.to change(Person, :count).by(-1)
  #   end

  #   it 'person to not deletes the person' do
  #     logged(@person)
  #     expect{
  #       delete :destroy, id: @person.id
  #     }.to_not change(Person, :count).by(-1)
  #   end

  #   it 'redirects to index' do
  #     logged(@person)
  #     delete :destroy, id: @people
  #     response.should redirect_to :index
  #   end
  # end

  private
  def filtered_attributes(person)
    person.attributes.except("id","created_at","updated_at","password","admin")
  end

end
