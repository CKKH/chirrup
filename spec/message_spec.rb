require 'message'

describe Message do
  subject(:message) { described_class.new(text_input) }
  let(:text_input) { :double }

  it 'responds to text_input' do
    expect(message).to respond_to(:text_input)
  end

  describe '#text_input' do
    it 'returns user input' do
      expect(message.text_input).to eq(text_input)
    end
  end

  describe '#time_stamp' do
    it 'returns timestamp of user input' do
      Timecop.freeze
      expect(message.timestamp).to eq(Time.now)
    end
  end

end
