require 'spec_helper'

describe ShoesController do

  let(:valid_attributes) { {} }

  before :each do
    @admin = FactoryGirl.create(:person)
    @enterprise = FactoryGirl.create(:enterprise)
    @shoe = FactoryGirl.create(:shoe)
  end

  describe 'Show' do

    it 'should show shoe' do
      login(@admin)
        get :show, id: @shoe
        response.should be_success
    end

    it 'renders the show view' do
      login(@admin)
        get :show, id: @shoe
        response.should render_template :show
    end

    context "when not admin" do
      it 'should redirect to login again' do
        get :show, id: @shoe
        response.should redirect_to login_user_path
      end
    end
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

    it 'should create shoe' do
    login_user(@enterprise)
      @new_shoe = Shoe.new(@shoe.attributes.except("id", "created_at","updated_at"))
      @new_shoe.name = "NewTitle"
      should_not eq('Shoe.count') do
        post :create, shoe: { name: @shoe.name}
      end
      response.should be_success
    end
  end

  describe 'DELETE destroy' do

    it 'admin to deletes the shoe' do
      login(@admin)
      expect{
        delete :destroy, id: @shoe
        }.to change(Shoe, :count).by(-1)
    end

    it 'shoe to not deletes the shoe' do
      login(@admin)
      expect{
        delete :destroy, id: @shoe.id
      }.to_not change(Shoe, :count).by(0)
    end

    it 'redirects to index' do
      login(@admin)
      delete :destroy, id: @shoe
      response.should
    end

    it 'enterprise to deletes the shoe' do
      login(@enterprise)
      expect{
        delete :destroy, id: @shoe
        }.to change(Shoe, :count).by(-1)
    end

    it 'shoe to not deletes the shoe' do
      login(@enterprise)
      expect{
        delete :destroy, id: @shoe.id
      }.to_not change(Shoe, :count).by(0)
    end
  end
end