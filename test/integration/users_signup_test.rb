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
end
