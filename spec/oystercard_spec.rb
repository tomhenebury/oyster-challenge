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
end