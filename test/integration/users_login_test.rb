require 'test_helper'
def setup
  @user = users(:stella) 
end

class UsersLoginTest < ActionDispatch::IntegrationTest
  test "login with invalid information" do
    get sessions_new_url
    assert_template 'sessions/new'
    post login_url, params: {sessions: {name: "",password: "" } }
    assert_template 'sessions/new'
    assert_not flash.empty?
    get root_path
    assert flash.empty
  end

  test "login with valid information" do
    get login_path
    post login_path, params: { session: {name:  @user.name, ppassword: 'password' } }
    assert_redirected_to @user
    follow_redirect!
    assert_template 'users/show'
    assert_select "a[href=?]", login_paath, count: 0
    assert_select "a[href=?]", logout_path
    assert_select "a[href=?]", user_path(@user)
  end
end
