require 'test_helper'

class UsersIndexTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:stella)
    @users = User.all
  end

  test "index page" do
    log_in_as(@user)
    get users_path
    assert_template 'users/index'
    @users.each do |user|
      assert_select 'a[href=?]', user_path(user), text: user.name
    end
  end
end

