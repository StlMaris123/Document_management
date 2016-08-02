require 'test_helper'

class UsersSignupTest < ActionDispatch::IntegrationTest
  def setup
    ActionMailer::Base.deliveries.clear
  end

  test "signup with invalid information" do
    get  new_user_url
    assert_no_difference 'User.count' do
      post users_path,params:{ user: {name: "", email: "ste@gmal", 
                                      password: "  ", password_confirmation: " "}}
    end
    assert_template 'users/new'
  end

  test "signup with valid information with account activation" do
    get new_user_url
    assert_difference 'User.count', 1 do
      post users_path, params:{ user: { name: "Stella", email: "stella@yahoo.com",
                                        password: "rainbow", password_connfirmation: "rainbow" } }
    end
    assert_equal 1, ActionMailer::Base.deliveries.size
    user = assigns(:user)
    assert_not user.activated?
    #try to log in before activation
    log_in_as(user)
    assert_not is_logged_in?
    #invalid activation token
    get edit_account_activation_path("invalid token")
    assert_not is_logged_in?
    #valid token , wrong email
    get edit_account_activation_path(user.activation_token, email: 'wrong')
    assert_not is_logged_in?
    #valid activation token
    get edit_account_activation_path(user.activation_token, email: user.email)
    assert user.reload.activated?
    follow_redirect!
    assert_template 'users/show'
    assert is_logged_in?
  end

end
