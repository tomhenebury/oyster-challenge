require './lib/oystercard.rb'

describe Oystercard do
    
    let(:oystercard) { Oystercard.new }
    let(:oystercard50) { Oystercard.new(50)} 
    let(:entry_station) { double :station}
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

    it '#is in journey?' do
        expect(oystercard.in_journey?).to be nil 
    end

    it '#allows us to touch in' do
        oystercard50.touch_in(entry_station)

        expect(oystercard50.in_journey?).to be entry_station
    end

    it '#allows us to touch out' do
        oystercard50.touch_in(entry_station)

        oystercard50.touch_out

        expect(oystercard50.in_journey?).to be nil
    end

    it '#will not allows touch in with 0 balance' do
        expect{oystercard.touch_in(entry_station)}.to raise_error "No Balance"
    end

    it '#charges on touch out' do
        expect{oystercard50.touch_out}.to change{oystercard50.balance}.by(-1)
    end 

    it '#expects the card to remember the entry station' do
        expect(oystercard50.touch_in(entry_station)).to eq entry_station
    end

    it '#expects card to forget the entry station on touch out' do
        oystercard50.touch_in(entry_station)
        oystercard50.touch_out
        expect(oystercard50.entry_station).to eq nil
    end




end
