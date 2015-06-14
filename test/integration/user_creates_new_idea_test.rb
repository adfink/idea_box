require 'test_helper'

class UserCreatesNewIdeaTest < ActionDispatch::IntegrationTest
  test 'a user can create a new idea' do
    user =  User.create(username: "drew", password:"password")
    visit login_path
    fill_in "Username", with: user.username
    fill_in "Password", with: "password"
    click_button "Login"

    assert page.has_content?("Welcome, drew")


    click_link "dump another shitty idea here"

    assert page.current_path, new_idea_path

    # save_and_open_page

    fill_in "Name", with: "kitten kaereoke app"
    fill_in "Description", with: "it's like kaereoke but for kittens... and they can share this crap with friends and stuff because the world needs more of that kind of thing"
    click_button "click this button to jettison this idea from your feeble, confused little mind"


    assert page.has_content?("kitten kaereoke app")
  end
end
