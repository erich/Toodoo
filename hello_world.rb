require "cuba"

Cuba.use Rack::Session::Cookie

Cuba.define do
	on get do

		on root do
			res.redirect "/tasks"
		end

		on "tasks" do
			res.write "List of tasks <br/> Add new task"
		end

		on  "task/:id/edit" do
			res.write "Edit task"
		end
	end

	on post do
		on "tasks" do
			res.redirect "/tasks"
		end
	end
end

