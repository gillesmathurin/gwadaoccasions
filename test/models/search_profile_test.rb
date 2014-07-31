require 'test_helper'

class SearchProfileTest < ActiveSupport::TestCase
  test 'search_profile_count prevents a user from recording more than 5 search profiles' do
    user = users(:fred)
    5.times do |i|
      SearchProfile.create(category: 'Voiture', minprice: (3000 + i * 100), maxprice: (6000 + i * 100), maxkilometer: 150000, minkilometer: 30000, user_id: user.id)
    end
    sp = SearchProfile.new(category: 'Voiture', minprice: 3000, maxprice: 6000, maxkilometer: 150000, minkilometer: 30000, user_id: user.id)
    refute sp.save
  end
end
