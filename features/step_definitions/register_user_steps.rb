include Devise::TestHelpers

Given /^I am not authenticated$/ do
  visit('/users/sign_out')
end

Given /^I have one\s+user "([^\"]*)" with password "([^\"]*)" and login "([^\"]*)"$/ do |email, password, login|
  User.new(:email => email,
           :login => login,
           :password => password,
           :password_confirmation => password).save!
end

Given /^I have one\s+user "([^\"]*)" with password "([^\"]*)"$/ do |email, password|
  @user = User.make(:email => email, :password => password, :password_confirmation => password)
  @user.update_attribute(:confirmed_at, Time.now)
  @user.update_attribute(:confirmation_sent_at, 1.hour.ago)
  # session[:user_id] = @user.id
end

Given /^I am a new, authenticated user$/ do
  email = 'testing@man.net'
  # login = 'Testing man'
  password = 'secretpass'

  Given %{I have one user "#{email}" with password "#{password}"}
  And %{I go to login}
  And %{I fill in "user_email" with "#{email}"}
  And %{I fill in "user_password" with "#{password}"}
  And %{I press "Sign in"}
end

Given /^I have a search profile for a "([^\"]*)" within "([^\"]*)" and "([^\"]*)"$/ do |category, minprice, maxprice|
  @search_profile = SearchProfile.make(:category => category, :minprice => minprice, :maxprice => maxprice, :user_id => @user.id)
end

Then /^I am redirected to "([^\"]*)"$/ do |url|
  assert [301, 302].include?(@integration_session.status), "Expected status to be 301 or 302, got #{@integration_session.status}, location #{@integration_session.headers["Location"]}"
  location = @integration_session.headers["Location"]
  assert_equal url, location
  visit location
end