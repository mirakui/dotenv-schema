require 'spec_helper'
require 'env_schema/schema'

describe EnvSchema::Schema do
  let(:schema) {
    described_class.load file <<-END
KEY1:
  allow_empty_string: true
  allow_not_exists: true
KEY2:
KEY3:
  allow_empty_string: false
    END
  }

  it do
    expect(schema).to eq({
'KEY1' => { 'allow_empty_string' => true, 'allow_not_exists' => true },
'KEY2' => nil,
'KEY3' => { 'allow_empty_string' => false },
    })
  end
end
