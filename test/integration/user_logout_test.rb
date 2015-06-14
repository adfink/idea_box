require 'test_helper'

class UserLogoutTest < ActionDispatch::IntegrationTest
  test "that a logged inuser can logout" do
    user =  User.create(username: "drew", password:"password")
    visit login_path
    fill_in "Username", with: user.username
    fill_in "Password", with: "password"
    click_button "Login"

    assert page.has_content?("Welcome, drew")

    click_link "Logout"

    refute page.has_content?("Welcome, drew")
  end
end
