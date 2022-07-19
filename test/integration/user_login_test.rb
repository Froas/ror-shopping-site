require 'test_helper'
class UsersLoginTest < ActionDispatch::IntegrationTest

  test "login" do
    get new_user_session_path
    post user_session, params: { session: { email: "naruto@example.com", 
                              password: "naruto@example.com" } }

    assert_redirected_to @user
  end
end