require "cuba/capybara"
require_relative './../tasks.rb'

scope do
  test "Homepage" do
    visit "/"
    assert has_content?("List of tasks")
  end
end
