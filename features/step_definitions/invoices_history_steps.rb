Given /^I have one active provider "([^\"]*)" with password "([^\"]*)" and login "([^\"]*)"$/ do |email, password, login|
  @provider = Provider.make(:email => email, :login => login, :password => password,
           :password_confirmation => password, :status => "active")
end

Given /^I am a new, authenticated active provider$/ do
  email = 'testing@man.net'
  login = 'Testing man'
  password = 'secretpass'

  Given %{I have one active provider "#{email}" with password "#{password}" and login "#{login}"}
  And %{I follow Admin}
  And %{I fill in "provider_email" with "#{email}"}
  And %{I fill in "provider_login" with "#{login}"}
  And %{I fill in "provider_password" with "#{password}"}
  And %{I press "Sign in"}
end

