require 'test_helper'

class SiteDashboardTest < ActionDispatch::IntegrationTest
  test "that the site's root can direct users to login path" do
    visit root_path
    click_button "Login"
    # save_and_open_page
    assert page.has_content?("login here please")
  end

  test "that the site's root can direct users to create a new account" do
    visit root_path
    click_button "create account"
    assert page.has_content?("create a new account please")
  end
end
