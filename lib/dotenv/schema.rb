require 'dotenv-schema'
require 'yaml'

module Dotenv
  class Schema < Hash
    class ValidationError < StandardError; end

    def initialize(hash={})
      replace hash if hash
    end

    def self.load(file)
      new YAML.load(File.read(file))
    end

    def validate!(env)
      undefined_keys = env.keys - keys
      unless undefined_keys.empty?
        raise ValidationError, "Undefined variable(s): #{undefined_keys.join(', ')}; Please add them into #{Dotenv.schema_path}"
      end
      each do |key, options|
        if env[key] == '' && (options && !options['allow_empty_string'] || !options)
          raise ValidationError, "ENV['#{key}'] must not be empty string"
        end
        if !env.has_key?(key) && (options && !options['allow_not_exists'] || !options)
          raise ValidationError, "ENV['#{key}'] must exist"
        end
      end
      true
    end
  end
end
