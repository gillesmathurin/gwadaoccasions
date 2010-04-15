module NavigationHelpers
  # Maps a name to a path. Used by the
  #
  #   When /^I go to (.+)$/ do |page_name|
  #
  # step definition in web_steps.rb
  #
  def path_to(page_name)
    case page_name
    
    when /the homepage/
      '/'
    when /searches\/index/
      searches_path
    when /a vehicle page/
      vehicle_path(Vehicle.first)
    when /register/
      '/users/sign_up'
    when /sign_in/
      '/users/sign_in'
    when /^(.*) profile page$/i
      # user_path(User.find_by_email($1).id)
      user_path(User.last.id)
    when /login/
      new_user_session_path
    when /user_root_path/
      '/users'
    when /new search_profile/
      new_user_search_profile_path(User.last.id)
    when /provider sign_up/
      new_provider_registration_path
    when /provider_root_path/
      '/providers'
    when /provider_login/
      '/providers/sign_in'
    when /subscription show/
      subscription_path(@subscription)
    when /congrats/
      congrats_path(@subscription)
    when /Historique Abonnement/
      provider_subscription_payment_notifications_path(@provider, @subscription)
    when /new salesman/
      new_provider_salesman_path(@provider)
    when /re-new salesman template/
      provider_salesmen_path(@provider)
    # Add more mappings here.
    # Here is an example that pulls values out of the Regexp:
    #
    #   when /^(.*)'s profile page$/i
    #     user_profile_path(User.find_by_login($1))

    else
      raise "Can't find mapping from \"#{page_name}\" to a path.\n" +
        "Now, go and add a mapping in #{__FILE__}"
    end
  end
end

World(NavigationHelpers)
