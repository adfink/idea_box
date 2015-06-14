require 'test_helper'

class UserCreationTest < ActionDispatch::IntegrationTest
  test "that a user can be created" do

    visit new_user_path
    fill_in "Username", with: "drew"
    fill_in "Password", with: "password"
    click_button "Create account"

    assert page.has_content?("Welcome, drew")

  end
end
