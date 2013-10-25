require 'dotenv'
require 'dotenv/schema'

module Dotenv
  def self.load_with_validation(*filenames)
    env_before = ENV.to_h
    load *filenames
    env = ENV.to_h.reject {|k, v| env_before.has_key?(k) }

    schema = Schema.load schema_path
    schema.validate! env
  end

  def self.schema_path=(path)
    @schema_path = path
  end

  def self.schema_path
    @schema_path || '.env_schema'
  end
end
