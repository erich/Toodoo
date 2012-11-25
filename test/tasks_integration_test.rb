require "cuba/capybara"
require_relative './../tasks.rb'

scope do
  test "Homepage" do
    visit "/"
    assert has_content?("List of tasks")
		click_link "New task" 
		assert_equal current_path, '/tasks/new'
  end
end
