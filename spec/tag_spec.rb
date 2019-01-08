 require 'tag'

describe Tag do
  subject(:tag) { described_class.create(:content => 'Tag test') }
  let(:id) { :double }

  describe '#content' do
    it 'returns user input' do
      expect(tag.content).to eq('Tag test')
    end
  end

  describe '#tag' do
    it 'returns tag id' do
      expect(tag.id).to eq("#{tag.id}".to_i)
    end
  end
end
