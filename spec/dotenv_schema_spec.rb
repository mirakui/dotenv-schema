require 'spec_helper'
require 'dotenv'
require 'dotenv-schema'
require 'tempfile'

describe 'Dotenv Schema' do
  before do
    %w[KEY1 KEY2 KEY3].each {|k| ENV.delete(k) }
  end

  it do
    Dotenv.schema_path = file <<-END
KEY1:
  allow_empty_string: true
  allow_not_exists: true
KEY2:
KEY3:
  allow_empty_string: false
    END
    expect {
      Dotenv.load file <<-END
KEY1=value1
KEY2=value2
KEY3=value3
      END
    }.not_to raise_error
  end
end
