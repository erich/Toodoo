require 'minitest/autorun'
require_relative '../../../app/models/task.rb'
require 'date'

class TaskTest < MiniTest::Unit::TestCase

	def setup
		@task = Task.new('test')
	end

	def test_name
		assert_equal 'test', @task.name 
	end

	def test_created_at 
		assert_instance_of Time, @task.created_at
		assert_equal Date.today.strftime, @task.created_at.strftime("%Y-%m-%d")
	end

	def test_complete_task
		assert_equal @task.completed?, false
		assert_nil @task.completed_at
		@task.complete!
		assert_equal @task.completed?, true
	end

	def test_completed_at_task
		assert_nil @task.completed_at
		@task.complete!
		assert_equal Date.today.strftime, @task.completed_at.strftime("%Y-%m-%d")
	end

	def test_order_by_created_at
	end
end

class TestTaskPstore <  MiniTest::Unit::TestCase

  def tests_generating_uniq_id
  end

	def test_saves_and_finds_task
    Task.save('task with name test', 23)
    found_task = Task.find(23)
	  assert_equal 'task with name test', found_task.name	
	end

	def tests_finds_all_tasks
	end

	def test_updates_task
	end

	def test_deletes_task
	end
end
