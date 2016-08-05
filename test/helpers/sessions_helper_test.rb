require 'test_helper'
class SessionsHelperTest < ActionView::TestCase
  def setup
    @user = users(:stella)
    remember(@user)
  end

  test "current_user returns right user when session is nil" do
    assert is_logged_in?
    assert_equal @user, current_user
  end

  test "current_user return nil when remember digest is wrong" do
    log_out
    @user.update_attribute(:remember_digest, User.digest(User.new_token))
    assert_nil current_user
  end
end
