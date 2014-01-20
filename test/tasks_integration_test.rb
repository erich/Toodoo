require "cuba/capybara"
require_relative './../tasks.rb'

scope do
  test "Add new task" do
    visit "/"
		click_link "New task" 
    within("#new_task") do 
      fill_in 'Name', :with => 'New task from Capybara'
    end
    click_on 'Add'
    assert_has_content?("New task from Capybara")
  end
end
