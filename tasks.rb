require "cuba"

Cuba.use Rack::Session::Cookie
Cuba.define do
	on get do
		on root do
			res.redirect "/tasks"
		end

		on "tasks" do
			res.write "List of tasks <br/> Add new task + #{session[:message]}"

			on ":id/edit" do
				res.write "Edit task"
			end

		end

	end

	on post do
		on "tasks" do
			session[:message] = "Task was successfully added"
			res.redirect "/tasks"
		end
	end
end

