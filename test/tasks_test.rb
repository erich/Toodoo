require_relative './../tasks.rb'
require "cuba/test"

#Reopen Cutest class to add assert_match
class Cutest::Scope
	private
	#last_response.body returns string, don't want to write exact whole string to make test pass
	def assert_match(value, other)
		flunk("#{value.inspect} =~ #{other.inspect}") unless other =~ Regexp.new(value)
		success
	end
end

scope do

  test "Homepage" do
    get "/"
    follow_redirect!
    assert_match  "List of tasks", last_response.body
  end


	test "Adding new valid task" do
		post "/tasks"
		follow_redirect!
		assert_match "Task was successfully added", last_response.body
	end

	test "Edit task" do
		get "/tasks/1/edit" 
		assert_match "Edit task", last_response.body
	end
end
