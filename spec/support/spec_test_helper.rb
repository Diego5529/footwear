module SpecTestHelper

  def login_user(enterprise)
    enterprise = Enterprise.find(enterprise.id)
    request.session[:id] = enterprise.id
  end

  def login(person)
    person = Person.find(person.id)
    request.session[:id] = person.id
    request.session[:admin] = person.admin
  end

  def login_client(client)
    client = Client.find(client.id)
    request.session[:id] = client.id
  end

  def current_user
    Person.find(request.session[:person])
    Client.find(request.session[:client])
    Enterprise.find(request.session[:enterprise])
  end
end