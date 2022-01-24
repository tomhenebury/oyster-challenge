class Oystercard

    attr_reader :balance
  
    def initialize(balance = 0)
        @balance = balance
    end

    def top_up(money)
        fail "#{@balance} cannot exceed £90" if (money + @balance) >= 90

        @balance += money
    end
end