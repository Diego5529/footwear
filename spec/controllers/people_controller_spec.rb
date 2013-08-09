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

  describe "new" do
    it "assigns all people as @people" do
     person = Person.new valid_attributes
     person.should_not be_valid
    end
  end

  # describe "new" do
  #   it "assigns all people as @people" do
  #    person = Person.new valid_attributes
  #    person.should_not be_valid
  #   end
  # end

  private
  def filtered_attributes(person)
    person.attributes.except("id","created_at","updated_at","password","admin")
  end

end
