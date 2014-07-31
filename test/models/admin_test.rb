require 'test_helper'
require 'bcrypt'

class AdminTest < ActiveSupport::TestCase
  test "verify_count prevents creation of more than one Admin" do
    admin = Admin.new(email: "test@example.com", password: "pleasepass", password_confirmation: "pleasepass")
    refute admin.save
  end
end
