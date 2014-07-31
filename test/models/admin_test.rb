require 'test_helper'
require 'bcrypt'

class AdminTest < ActiveSupport::TestCase
  test "verify_count prevents creation of more than one Admin" do
    puts Admin.count
    admin = Admin.new(email: "test@example.com", encrypted_password: "please")
    refute admin.save
  end
end
