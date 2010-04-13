Given /^there are no providers yet$/ do
  Provider.delete_all
end

Given /^I am not authenticated as provider$/ do
  visit('/providers/sign_out')
end

Given /^There is a subscription plan$/ do
  @plan = Plan.make(:nom => "Standard", :id => 1)
end

Given /^I have one\s+provider "([^\"]*)" with password "([^\"]*)" and login "([^\"]*)"$/ do |email, password, login|
  @provider = Provider.make(:email => email, :login => login, :password => password,
           :password_confirmation => password)
end

Given /^I follow Espace Pro$/ do
  # visit path_to("provider_login")
  click_link("Espace Pro")
end

Given /^I am a new, authenticated pending provider$/ do
  email = 'testing@man.net'
  login = 'Testing man'
  password = 'secretpass'

  Given %{I have one provider "#{email}" with password "#{password}" and login "#{login}"}
  And %{I follow Espace Pro}
  And %{I fill in "provider_email" with "#{email}"}
  And %{I fill in "provider_login" with "#{login}"}
  And %{I fill in "provider_password" with "#{password}"}
  And %{I press "Sign in"}
end

Given /^I have a pending subscription$/ do
  # @subscription = @provider.create_subscription(:plan_id => @plan)
  @subscription = Subscription.make(:provider => @provider, :plan => @plan)
end

When /^I choose to create a "([^\"]*)" plan$/ do |arg1|
  choose arg1
end

When /^I press on Payer sur paypal button$/ do
  # TODO : stub or mock the process of paypal payment using fakeweb and Net::HTTP
  FakeWeb.allow_net_connect = false
  # TODO : refactor this method to set the response the paypal ipn
  FakeWeb.register_uri(:post, "https://www.sandbox.paypal.com/cgi-bin/websrc", :body => "VERIFIED")
  # TODO : then register another uri who verify the ipn
  url = URI.parse("https://www.sandbox.paypal.com/cgi-bin/websrc")
  http = Net::HTTP.new(url.host, 443)
  http.use_ssl = true
  response = http.start { http.post(url.path, {}) }
  FakeWeb.allow_net_connect = true
  response == "VERIFIED"
end


Then /^I should have a pending subscription$/ do
  # @subscription = @provider.subscription.make
  @subscription = Subscription.make(:provider => @provider, :plan => @plan)
end


Then /^I should have "([^\"]*)" provider$/ do |arg1|
  @provider = Provider.last
  Provider.count == arg1
end

Then /^I should have a paid subscription$/ do
  @subscription.status == "paid"
end

Then /^I should have an active provider account$/ do
  @provider.status == "active"
end
