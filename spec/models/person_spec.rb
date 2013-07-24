# encoding: utf-8
require 'spec_helper'

describe Person do
  
  let(:person) do
    person = FactoryGirl.create(:person)
   end

 # NAME

  it "should not have a blank name" do
    person = FactoryGirl.build(:person, name: '')
    person.should_not be_valid
  end
  
  # #PASSWORD
  # it "should not have a blank name" do
  #   person = FactoryGirl.build(:person, password:'')
  #   person.should_not be_valid
  # end
end

	# #Name not empty
 # 	it "não pode ter nome vazio" do
 #     	@person.name = nil?
	# should !@person.valid?
	# end

# 	#Restricts the name to 50 characters
# 	test "não pode ter nome maior que 50 caracteres" do
# 		@person.name = "*"*51
# 		assert !@person.valid?
# 	end
# end
