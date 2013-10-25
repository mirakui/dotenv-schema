require 'yaml'

module EnvSchema
  class ValidationError < StandardError; end
  class Schema < Hash
    def initialize(hash={})
      self.replace hash if hash
    end

    def self.load(file)
      new YAML.load(File.read(file))
    end

    def validate(env=ENV)
      each do |key, value|
        if has_key?(key)
          if !env['allow_empty_string'] && env[key].nil?
            raise ValidationError, "ENV['#{key}'] must not be empty string"
          end
          if !env['allow_not_exists'] && !env.has_key?(key)
            raise ValidationError, "ENV['#{key}'] must exist"
          end
        end
      end
      true
    end
  end
end
