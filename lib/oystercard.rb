class Oystercard

    MAXIMUM_BALANCE = 90

    attr_reader :balance
  
    def initialize(balance = 0)
        @balance = balance
        @in_journey = false
    end

    def in_journey?
        @in_journey
    end

    def touch_in
        @in_journey = true
    end

    def touch_out
        @in_journey = false
    end

    def top_up(money)
        fail "#{@balance} cannot exceed #{MAXIMUM_BALANCE}" if (money + @balance) > MAXIMUM_BALANCE

        @balance += money
    end

    def deduct(money)
        @balance -= money
    end
end
