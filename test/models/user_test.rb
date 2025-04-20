require "test_helper"

class UserTest < ActiveSupport::TestCase
  setup do
    @user = users(:one) # References a fixture
  end

  test "should be valid with valid attributes" do
    assert @user.valid?
  end

  test "should not be valid without a name" do
    @user.name = nil
    assert_not @user.valid?
    assert_includes @user.errors[:name], "can't be blank"
  end

  test "should not be valid with an invalid email" do
    @user.email = "invalid_email"
    assert_not @user.valid?
    assert_includes @user.errors[:email], "is invalid"
  end
end
