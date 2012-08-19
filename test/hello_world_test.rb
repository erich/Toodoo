require_relative './../hello_world.rb'
require "cuba/test"

#Reopen Cutest class to add assert_match
class Cutest::Scope
	private
	#last_response.body returns string, don't want to write exact whole string to make test past
	def assert_match(value, other)
		flunk("#{value.inspect} =~ #{other.inspect}") unless other =~ Regexp.new(value)
		success
	end
end

scope do

	setup do 
		@valid_task = ""
		@invalid_task = ""
	end

  test "Homepage" do
    get "/"
    follow_redirect!
    assert_match  "List of tasks", last_response.body
  end


	test "Adding new valid task" do
		post "/tasks"
		follow_redirect!
		assert_match "Task was added successfully", last_response.body
	end

	test "Adding new invalid task" do
		post "/tasks"
		follow_redirect!
		assert_match "Task is not valid", last_response.body
	end

	test "Edit new task" do
		get "/tasks/1" 
		assert_match "New task", last_response
	end
end
