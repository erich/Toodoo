require 'minitest/autorun'

require_relative '../../../app/validators/store_task_validator.rb'

class TaskDouble
  attr_accessor :name

  def initialize(name)
    @name = name
  end
end


class StoreTaskValidatorTest < MiniTest::Unit::TestCase

  def test_invalid_task
    invalid_task = TaskDouble.new('')
    assert_equal StoreTaskValidator.new(invalid_task).valid?, false
  end

  def test_valid_task
    valid_task = TaskDouble.new('valid')
    assert_equal StoreTaskValidator.new(valid_task).valid?, true
  end

end
