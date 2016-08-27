require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @user = User.new(name: "Stella", email: "stella@yahoo.com",
                     password: "rainbow", password_confirmation: "rainbow")
  end

  test "user should be valid" do
    assert @user.valid?
  end

  test "name should be present" do
    @user.name = "    "
    assert_not  @user.valid?
  end

  test "email should be present" do
    @user.email = "    "
    assert_not @user.valid?
  end

  test "name should not be too long" do
    @user.name = "a" * 51
    assert_not @user.valid?
  end

  test "email should not be too long" do
    @user.email = "a" * 241 + "@yahoo.com"
    assert_not @user.valid?
  end

  test "only valid addresses should be accepted" do
    valid_addresses = %w[ste@gamil.com StE@ga.com ste_marus@g.co.ke ste_maris@ta.c]
    valid_addresses.each do|valid_address|
      @user.email = valid_address
      assert @user.valid?,"#{valid_address.inspect} should be valid"
    end
  end
  test "invalid email addresses should be rejectected" do
    invalid_addresses = %w[ste@gmail ste@ga,com ste@gam+mail ste.co.ke ste@gmail_com]
    invalid_addresses.each do |invalid_address|
      @user.email = invalid_address
      assert_not @user.valid?,"#{invalid_address.inspect} should be valid"
    end
  end
  test "email addresses should be unique" do
    duplicate_user = @user.dup
    duplicate_user.email = @user.email.upcase
    @user.save
    assert_not duplicate_user.valid?
  end

  test "password minimum length should be six" do
    @user.password = @user.password_confirmation =  "a" * 55555
    assert_not @user.valid?
  end
end

