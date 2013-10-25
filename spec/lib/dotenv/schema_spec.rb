require 'spec_helper'
require 'dotenv/schema'

describe Dotenv::Schema do
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
'KEY3' => { 'allow_empty_string' => false }
    })
  end

  it do
    expect {
      schema.validate!({
        'KEY1' => 'VALUE1',
        'KEY2' => 'VALUE2',
        'KEY3' => 'VALUE3'
      })
    }.not_to raise_error
  end

  it do
    expect {
      schema.validate!({
        'KEY1' => 'VALUE1',
        'KEY3' => 'VALUE3'
      })
    }.to raise_error(Dotenv::Schema::ValidationError)
  end
end
