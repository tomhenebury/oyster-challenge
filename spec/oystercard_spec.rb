require './lib/oystercard.rb'

describe Oystercard do
    let(:oystercard) { Oystercard.new }

    it '#\'s initializes to 0' do
        expect(oystercard.balance).to eq 0
    end

    it '#can be topped up' do
        oystercard.top_up(15)

        expect(oystercard.balance).to eq 15
    end

    it '#has a max limit of 90' do
        expect{ oystercard.top_up(91) }.to raise_error "#{oystercard.balance} cannot exceed £90"
    end
end