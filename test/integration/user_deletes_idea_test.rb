require 'test_helper'

class UserDeletesIdeaTest < ActionDispatch::IntegrationTest
  test 'user can delete their ideas' do
    login_and_submit_three_ideas
    assert page.has_content?("kitten kaereoke app")
    within first(:css, 'li') do
      click_link "click here to delete this abomination of a thought"
    end
    refute page.has_content?("kitten kaereoke app")

  end

end
