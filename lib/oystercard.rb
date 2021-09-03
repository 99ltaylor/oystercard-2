class Oystercard
  MAX_BALANCE = 90
  MINIMUM_BALANCE = 1

  attr_reader :balance
  attr_accessor :in_journey

  def initialize
    @balance = 0
    @in_journey = false
  end

  def top_up(value)
    fail "credit cannot be added, card balance exceeds #{MAX_BALANCE}" if value + balance > MAX_BALANCE
    @balance += value
  end

  def deduct(value)
    @balance -= value
  end

  def in_journey?
    false
  end

  def touch_in
    fail "Balance below #{MINIMUM_BALANCE}" if @balance < MINIMUM_BALANCE
    @in_journey = true
  end

  def touch_out
    @in_journey = false
  end
end
