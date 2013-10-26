require 'dotenv'
require 'dotenv/schema'

module Dotenv
  class << self
    def load_with_validation(*filenames)
      env_before = ENV.to_hash
      load_without_validation *filenames
      env = ENV.to_hash.reject {|k, v| env_before.has_key?(k) }

      schema = Schema.load schema_path
      schema.validate! env
    end
    alias_method :load_without_validation, :load
    alias_method :load, :load_with_validation

    def schema_path=(path)
      @schema_path = path
    end

    def schema_path
      @schema_path || '.env_schema'
    end
  end
end
