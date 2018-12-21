require 'message'

describe Message do
  subject(:message) { described_class.create(:content => 'Test') }

  describe '#content' do
    it 'returns user input' do
      expect(message.content).to eq('Test')
    end
  end

  describe '#timestamp' do
    it 'returns timestamp of user input' do
      expect(message.timestamp).to eq(Time.now.strftime("%d-%m-%Y %H:%M:%S"))
    end
  end

  describe '#id' do
    it 'returns message id' do
      expect(message.id).to eq(8)
    end
  end

end
