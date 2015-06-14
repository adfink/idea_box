ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require 'capybara/rails'
require 'minitest/pride'

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Add more helper methods to be used by all tests here...
end

class ActionDispatch::IntegrationTest
  include Capybara::DSL

  def login_and_submit_three_ideas
    user =  User.create(username: "drew", password:"password")
    visit login_path
    fill_in "Username", with: user.username
    fill_in "Password", with: "password"
    click_button "Login"
    click_link "dump another shitty idea here"
    fill_in "Name", with: "kitten kaereoke app"
    fill_in "Description", with: "it's like kaereoke but for kittens... and they can share this crap with friends and stuff because the world needs more of that kind of thing"
    click_button "click this button to jettison this idea from your feeble, confused little mind"

    click_link "dump another shitty idea here"
    fill_in "Name", with: "eat dirt"
    fill_in "Description", with: "it's natural so it must be good right?"
    click_button "click this button to jettison this idea from your feeble, confused little mind"

    click_link "dump another shitty idea here"
    fill_in "Name", with: "watch tv"
    fill_in "Description", with: "its just such a good use of time!"
    click_button "click this button to jettison this idea from your feeble, confused little mind"
  end

  def teardown
    reset_session!
  end
end
