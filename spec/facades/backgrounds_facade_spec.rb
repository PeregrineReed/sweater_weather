require 'rails_helper'

describe 'BackgroundsFacade' do
  before :each do
    @location = 'denver,co'
    @facade = BackgroundsFacade.new(@location)
  end
  it 'exists' do
    expect(@facade).to be_a(BackgroundsFacade)
  end

  describe 'instance methods' do
    describe '#image' do
      it 'returns a picture url from the location' do
        expect(@facade.location).to be_a(Background)
      end
    end
  end
end
