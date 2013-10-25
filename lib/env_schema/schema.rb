require 'yaml'

module EnvSchema
  class Schema < Hash
    def initialize(hash={})
      self.replace hash if hash
    end

    def self.load(file)
      new YAML.load(File.read(file))
    end

    def validate
    end
  end
end
