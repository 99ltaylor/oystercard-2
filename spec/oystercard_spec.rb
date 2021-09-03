require "oystercard.rb"

describe Oystercard do
  it "has initial balance of zero" do
    expect(subject.balance).to eq(0)
  end

  describe "#top_up" do
    
    it {is_expected.to respond_to(:top_up).with(1).argument}

    it "can top up the balance" do 
      expect{subject.top_up 2}.to change{ subject.balance}.by 2
    end

    it "prevents a balance of over £90" do
      maximum_balance = Oystercard::MAX_BALANCE
      subject.top_up(maximum_balance)
      expect{subject.top_up 15}.to raise_error "credit cannot be added, card balance exceeds #{maximum_balance}"
    end
  end

  describe '#deduct'do 
    it {is_expected.to respond_to(:deduct).with(1).argument}
    end
    it "deducts money from oystercard" do
      expect{subject.deduct 3}.to change{ subject.balance }.by -3
    end
  
  describe 'in journey' do
    it "is initially not in journey" do
      expect(subject).not_to be_in_journey
    end

    it {is_expected.to respond_to(:touch_in)}
    it 'should be on a journey when the card is touched in' do 
      subject.touch_in
      expect(subject.in_journey).to eq(true)
    end

    it {is_expected.to respond_to(:touch_out)}
    it 'should not be on a journey when the card is touched out' do 
      subject.touch_in
      subject.touch_out
      expect(subject.in_journey).to eq(false)
    end

  end
end