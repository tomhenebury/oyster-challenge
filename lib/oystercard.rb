class Oystercard

    MAXIMUM_BALANCE = 90

    attr_reader :balance
  
    def initialize(balance = 0)
        @balance = balance
    end

    def top_up(money)
        fail "#{@balance} cannot exceed #{MAXIMUM_BALANCE}" if (money + @balance) > MAXIMUM_BALANCE

        @balance += money
    end

    def deduct(money)
        @balance -= money
    end
end
