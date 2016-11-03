require 'spec_helper'

describe Booking do

  subject(:booking) {described_class.new}
  let(:house) {double(owner: "Bob")}

  it "knows if it is confirmed" do
    expect(booking).to respond_to(:confirmed)
  end

  it "has one space associated with it" do
    expect(booking).to respond_to(:space)
  end

  it "knows who requested the booking" do
    expect(booking).to respond_to(:requester)
  end

  it "is initially a request" do
    expect(booking.confirmed).to eq false
  end

  it "can be confirmed" do
    booking.confirm
    expect(booking.confirmed).to eq true
  end

  it "can't be confimed more than once" do
    booking.confirm
    expect{booking.confirm}.to raise_error("Already confirmed")
  end

  it "knows the owner of the space" do
    allow(booking).to receive(:space).and_return(house)
    expect(booking.space_owner).to eq "Bob"
  end
end
