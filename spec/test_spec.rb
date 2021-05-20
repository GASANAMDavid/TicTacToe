require_relative '../lib/test'
require 'stringio'

RSpec.describe Test do
  let(:output) { StringIO.new }
  it 'outputs something' do
    subject.test(output)
    expect(output.string).to eq("Hello setting project fom scratch\n")
  end
end
