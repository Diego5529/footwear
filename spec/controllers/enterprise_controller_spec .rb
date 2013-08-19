require 'spec_helper'

describe EnterpriseController do

  # # This should return the minimal set of attributes required to create a valid
  # # Enterprise. As you add validations to Enterprise, be sure to
  # # adjust the attributes here as well.
  # let(:valid_attributes) { { "name" => "MyString" } }
  # let(:valid_attributes) { { "password" => "123456" } }

  # # This should return the minimal set of values that should be in the session
  # # in order to pass any filters (e.g. authentication) defined in
  # # EnterpriseControler. Be sure to keep this updated too.
  # let(:valid_session) { {:id} }

  describe "GET index" do
    context "when not logged" do
      it 'should redirect to login' do
        get :index
        response.should redirect_to login_path
      end
    end
  end


   describe "GET new" do
  it 'assigns a new object to the enterprise' do
      get :new
      assigns(:enterprise).should
    end
  end

  # it "should be valid" do
  #   @enterprise.should be_valid
  # end

  # before do
  #   # @enterprise = create(:game_translator_user, role: 'reviser')
  #   # @translator = create(:game_translator_user, role: 'translator')
  #   @enterprise = create(:enterprise, name: 'Test', password: '123123123')
  # end

  #  context 'with invalid attributes' do
  #     it 'render the edit view' do
  #       put :update, { id: @enterprise.id, enterprise: { email: 'foo@' } }
  #       response.should render_template :edit
  #     end

  #     it 'not changes the enterprise attributes' do
  #       put :update, { id: @enterprise.id, game_translator_user: { email: 'foo@', name: 'Test Bar' } }
  #       @enterprise.reload
  #       @enterprise.name.should == 'Test'
  #     end
  #   end
  # end



end
