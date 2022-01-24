require './lib/Oystercard.rb'

describe Oystercard do
    let(:oystercard) { Oystercard.new }

    it '#\'s initializes to 0' do
        expect(oystercard.balance).to eq 0
    end
end