require 'pstore'

class TaskPstore 
	def self.save(task)
		true
	end
end

class Task

	attr_accessor :name, :created_at, :completed_at

	def initialize(name)
		@name = eame
		@created_at = Time.now
	end

	def complete!
		@completed_at = Time.now
	end

	def completed?
		!!@completed_at
	end

	def self.save(name)
		TaskPstore.save(new(name))
	end
end

