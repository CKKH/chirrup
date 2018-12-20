require 'message'

describe Message do
  subject(:message) { described_class.new(content) }
  let(:content) { :double }

  describe '#content' do
    it 'returns user input' do
      expect(message.content).to eq(content)
    end
  end

  describe '#time' do
    it 'returns timestamp of user input' do
      Timecop.freeze
      expect(message.time).to eq(Time.now)
    end
  end

end
