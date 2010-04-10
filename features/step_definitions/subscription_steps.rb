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
  @subscription = @provider.subscription
end

When /^I choose to create a "([^\"]*)" plan$/ do |arg1|
  choose arg1
end

Then /^I should have a pending subscription$/ do
  @subscription = @provider.subscription.make
end


Then /^I should have "([^\"]*)" provider$/ do |arg1|
  @provider = Provider.last
  Provider.count == arg1
end

