require './lib/oystercard.rb'

describe Oystercard do
    
    let(:oystercard) { Oystercard.new }
    let(:oystercard50) { Oystercard.new(50)} 

    it '#\'s initializes to 0' do
        expect(oystercard.balance).to eq 0
    end

    it '#can be topped up' do
        oystercard.top_up(15)

        expect(oystercard.balance).to eq 15
    end

    it '#has a max limit of 90' do
      maximum_balance = Oystercard::MAXIMUM_BALANCE

      oystercard.top_up(90)
      expect{ oystercard.top_up(1) }.to raise_error "#{oystercard.balance} cannot exceed #{maximum_balance}"
    end

    it '#can have money deducted' do
        expect{oystercard50.deduct(20)}.to change { oystercard50.balance }.by(-20)
    end

    it '#is in journey?' do
        expect(oystercard.in_journey?).to be false
    end

    it '#allows us to touch in' do
        oystercard.touch_in

        expect(oystercard.in_journey?).to be true 
    end

    it '#allows us to touch out' do
        oystercard.touch_in

        oystercard.touch_out

        expect(oystercard.in_journey?).to be false
    end
end
