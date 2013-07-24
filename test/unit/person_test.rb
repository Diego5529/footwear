# encoding: utf-8
require 'test_helper'

class PersonTest < ActiveSupport::TestCase
  	
	#configures the keys to the tests
  	setup do
	     @person = people(:admin)
	end

	#person is valid
	test "tem que ser válido sem alterações" do
		assert @person.valid?
	end

	#Name not empty
	test "não pode ter nome vazio" do
     	@person.name = ""
		assert !@person.valid?
	end

	test "não pode ter nome vazio" do
     	@person.password = ""
		assert !@person.valid?
	end

	#Restricts the name to 50 characters
	test "não pode ter nome maior que 50 caracteres" do
		@person.name = "*"*51
		assert !@person.valid?
	end
end
