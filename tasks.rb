require "cuba"
require "cuba/render"
require "slim"

require_relative 'config/views'


Cuba.use Rack::Session::Cookie

Cuba.define do
	on get do
		on root do
			res.redirect "/tasks"
		end

		on "tasks" do
			res.write render('views/index.slim', content: session[:message])

			on ":id/edit" do
				res.write "Edit task"
			end
			
			on "new" do
				res.write render("views/new.slim", content: session[:message])
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

