require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test 'matching_vehicles returns vehicles matching user search profiles' do
    user = users(:fred)
    sp = search_profiles(:one)
    car = vehicles(:sp_vehicle)
    assert_includes(user.search_profiles, sp)
    assert_includes(user.matching_vehicles, car)
  end
end
