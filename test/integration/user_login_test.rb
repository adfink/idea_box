require 'test_helper'

class UserLoginTest < ActionDispatch::IntegrationTest
  test "that a user can login" do
    user =  User.create(username: "drew", password:"password")
    visit login_path
    fill_in "Username", with: user.username
    fill_in "Password", with: "password"
    click_button "Login"

    assert page.has_content?("Welcome, drew")

  end
end
