require 'test_helper'

class VehicleMailerTest < ActionMailer::TestCase
  test "to_friend" do
    @expected.subject = 'VehicleMailer#to_friend'
    @expected.body    = read_fixture('to_friend')
    @expected.date    = Time.now

    assert_equal @expected.encoded, VehicleMailer.create_to_friend(@expected.date).encoded
  end

end
