class Oystercard

    MAXIMUM_BALANCE = 90
    MINIMUM_BALANCE = 1

    attr_reader :balance, :entry_station
  
    def initialize(balance = 0)
        @balance = balance
    end

    def in_journey?
        @entry_station
    end

    def touch_in(entry_station) 
        fail "No Balance" if @balance < MINIMUM_BALANCE
        @entry_station = entry_station
    end

    def touch_out
        deduct(MINIMUM_BALANCE)
        @entry_station = nil
    end

    def top_up(money)
        fail "#{@balance} cannot exceed #{MAXIMUM_BALANCE}" if (money + @balance) > MAXIMUM_BALANCE

        @balance += money
    end

    private def deduct(money)
        @balance -= money
    end
end
