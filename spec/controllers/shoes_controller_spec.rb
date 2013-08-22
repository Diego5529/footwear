require 'spec_helper'

describe ShoesController do

  let(:valid_attributes) { {} } 
  let(:valid_session) { {} }

  before :each do
    @shoe = FactoryGirl.create(:shoe)
  end

   describe "GET index" do
    context "when not logged" do
      it 'should redirect to login' do
        get :index
        response.should redirect_to login_user_path
      end
    end
  end

  describe "GET new" do
    it 'assigns a new object to the shoe' do
      get :new
      assigns(:shoe).should
    end
  end

  it "should create shoe" do
    assigns('Shoe.count') do
      post :create, shoe: { enterprise_id: @shoe.enterprise_id,text: @shoe.text, value: @shoe.value }
    end
  end

  describe "new" do
    it "assigns all shoe as @shoe" do
     shoe = Shoe.new valid_attributes
     shoe.should_not be_valid
    end
  end

  describe 'POST create' do
    it 'create shoe with valid attributes' do
        post :create, shoe: FactoryGirl.attributes_for(:shoe)
        response.should
      end
  end

  # it "should show shoe" do
  #   get :show, id: @shoe
  #   assert_response :success
  # end

  # it "should get edit" do
  #   get :edit, id: @shoe
  #   assert_response :success
  # end

  # describe 'DELETE destroy' do

  #   it 'admin to deletes the shoe' do
  #     login_user(@shoe)
  #     expect{
  #       delete :destroy, id: @shoe.id}.to change(Person, :count).by(-1)
  #   end

  #   it 'shoe to not deletes the shoe' do
  #     login_user(@shoe)
  #     expect{
  #       delete :destroy, id: @shoe.id
  #     }.to_not change(Person, :count).by(-1)
  #   end

  #   it 'redirects to index' do
  #     login_user(@shoe)
  #     delete :destroy, id: @shoe
  #     response.should redirect_to :index
  #   end
  # end

  private
  def filtered_attributes(shoe)
    shoe.attributes.except("id","created_at","updated_at","password","admin")
  end
end