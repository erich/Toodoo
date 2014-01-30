require "cuba/capybara"
require_relative './../tasks.rb'

scope do
  test "Add new task" do
    visit "/"
		click_link "New task" 
    fill_in 'name', :with => 'New task from Capybara'
    click_on 'Add'
    assert has_content?("New task from Capybara")
  end
end
