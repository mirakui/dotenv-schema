require 'dotenv/schema'

module Dotenv
  module_function
  def schema_path=(path)
    @schema_path = path
  end
end
