require 'test_helper'

class PaymentNotificationTest < ActiveSupport::TestCase
  test "verified payment notification creation marks subscription as verified and activates provider" do
    skip("got to find a way to handle the params hash object")
  end

  test 'paid payment notification creation marks subscription as verified and activates provider' do
    skip("got to find a way to handle the params hash object")
  end

  test 'cancel payment notification creation marks subscription as cancelled and set provider to pending state' do
    skip("got to find a way to handle the params hash object")
  end
end
