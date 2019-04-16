require 'rails_helper'

describe 'BackgroundsService' do
  before :each do
    @location = 'denver,co'
    @service = BackgroundsService.new(@location)
  end
  it 'exists' do
    expect(@service).to be_a(BackgroundsService)
  end
  describe 'instance methods' do
    describe '#landscape' do
      it 'returns a landscape orientation picture from the area provided in the location' do
        orientation = @service.landscape[:results][0][:width] > @service.landscape[:results][0][:height]

        expect(@service.landscape).to be_a(Hash)
        expect(orientation).to eq(true)
      end
    end
  end
end
