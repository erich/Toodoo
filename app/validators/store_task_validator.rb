require 'validation'
require 'validation/rule/not_empty'

class StoreTaskValidator < Validation::Validator
  include Validation
  
  rule :name, :not_empty
end
