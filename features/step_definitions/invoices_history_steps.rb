Given /^I have one active provider "([^\"]*)" with password "([^\"]*)" and login "([^\"]*)"$/ do |email, password, login|
  @provider = Provider.make(:email => email, :login => login, :password => password,
           :password_confirmation => password, :status => "active")
end

Given /^I am a new, authenticated active provider$/ do
  email = 'testing@man.net'
  login = 'Testing man'
  password = 'secretpass'

  Given %{I have one active provider "#{email}" with password "#{password}" and login "#{login}"}
  And %{I follow Espace Pro}
  And %{I fill in "provider_email" with "#{email}"}
  And %{I fill in "provider_login" with "#{login}"}
  And %{I fill in "provider_password" with "#{password}"}
  And %{I press "Sign in"}
end

Given /^I have been subscribed since "([^\"]*)" months$/ do |arg1|
  number = arg1.to_i
  @subscription = Subscription.make(:provider => @provider, :status => "verified")
  while number > 0
   PaymentNotification.make(:created_at => number.months.ago, :subscription => @subscription)
    number = number - 1    
  end
  # @subscription.payment_notifications << PaymentNotification.make(:created_at => 3.months.ago)
  # @subscription.payment_notifications << PaymentNotification.make(:created_at => 2.months.ago)
  # @subscription.payment_notifications << PaymentNotification.make(:created_at => 1.months.ago)
end
