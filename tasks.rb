require "cuba"
require "cuba/render"
require "slim"

require_relative 'config/views'
require_relative 'app/models/task.rb'


Cuba.use Rack::Session::Cookie, secret: 'as131*)Dasd'

Cuba.define do
	on get do

		on "tasks" do
			res.write render('views/index.slim', content: session[:message], tasks: Task.all)

			on ":id/edit" do
				res.write "Edit task"
			end
			
			on "new" do
				res.write render("views/new.slim", content: session[:message])
			end

		end

		on root do
			res.redirect "/tasks"
		end

	end

	on post do
		on "tasks" do
      on param('name') do |name|
        Task.save(name, 123123)
        session[:message] = "Task was successfully added"
        res.redirect "/tasks"
      end
		end
	end
end

