require 'rails_helper'

describe 'Background' do
  before :each do
    @file = File.read('./fixtures/background.json')
    @data = JSON.parse(@file, symbolize_names: true)
    @background = Background.new(@data)
  end

  it 'exists' do
    expect(@background).to be_a(Background)
  end

  describe 'instance methods' do
    describe '#id' do
      it 'returns an id for an image' do
        expect(@background.id).to eq('N_tcaOWTSQQ')
      end
    end
    describe '#url' do
      it 'returns a url for an image' do
        expect(@background.url).to eq('https://images.unsplash.com/photo-1521224911436-5b591bffc321?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjY2ODM4fQ')
      end
    end
    describe '#description' do
      it 'returns a description for an image' do
        expect(@background.description).to eq('Pikes Peak')
      end
    end
    describe '#alt_description' do
      it 'returns a description for an image' do
        expect(@background.alt_description).to eq('landscape photography of black mountains')
      end
    end
  end
end
