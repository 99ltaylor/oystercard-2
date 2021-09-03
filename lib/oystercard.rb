class Oystercard
  MAX_BALANCE = 90

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
  @in_journey = true
 end

 def touch_out
  @in_journey = false
 end
end
