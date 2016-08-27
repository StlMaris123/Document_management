require 'test_helper'

class UsersSignupTest < ActionDispatch::IntegrationTest
  test "signup with invalid information" do
    get  users_new_url
    assert_no_difference 'User.count' do
      post users_path,params:{ user: {name: "", email: "ste@gmal", 
                                      password: "  ", password_confirmation: " "}}
    end
    assert_template 'users/new'
  end

  test "signup with valid information" do
    get users_new_url
    assert_difference 'User.count', 1 do
      post_via_redirect users_path, params:{ user: { name: "Stella", email: "stella@yahoo.com",
                                        password: "rainbow", password_connfirmation: "rainbow" } }
    end
    assert_template 'users/show'
    assert is_logged_in?
  end

end
