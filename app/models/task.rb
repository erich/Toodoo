require 'pstore'

class TaskPstore 
  def self.save(task, id)
    task_pstore = PStore.new('db/toodoo.pstore')
    task_pstore.transaction do 
      task_pstore[id] = task
    end
  end

  def self.find(id)
    task_pstore = PStore.new('db/toodoo.pstore')
    task_pstore.transaction(true) do
      task_pstore[id]
    end
  end

  def self.all
    task_pstore = PStore.new('db/toodoo.pstore')
    all_tasks = task_pstore.transaction(true) do 
     task_pstore.roots.inject([]) do |array, task_id| 
        array << task_pstore[task_id]
      end
    end
    all_tasks
  end
end

class Task

  attr_accessor :name, :created_at, :completed_at

  def initialize(name)
    @name = name
    @created_at = Time.now
  end

  def complete!
    @completed_at = Time.now
  end

  def completed?
    !!@completed_at
  end

  def self.save(name, id)
    TaskPstore.save(new(name), id)
  end

  def self.find(id)
    TaskPstore.find(id)
  end

  def self.all
    TaskPstore.all
  end
end

