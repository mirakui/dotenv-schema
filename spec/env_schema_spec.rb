require 'spec_helper'
require 'env_schema'
require 'tempfile'

describe 'EnvSchema' do
  before do
    %w[KEY1 KEY2 KEY3].each {|k| ENV.delete(k) }
  end

  it do
    ENV['KEY1'] = 'value1'
    ENV['KEY2'] = 'value2'
    ENV['KEY3'] = 'value3'
    expect {
      EnvSchema.validate(file <<-END)
KEY1:
  allow_empty_string: true
  allow_not_exists: true
KEY2:
KEY3:
  allow_empty_string: false
      END
    }.not_to raise_error
  end
end
