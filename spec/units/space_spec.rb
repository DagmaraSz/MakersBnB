require 'spec_helper'

describe Space do
  subject(:space) {described_class.new}
  it "has a name" do
    expect(space).to respond_to(:name)
  end
  it "has an address" do
    expect(space).to respond_to(:address)
  end

  it "has a price" do
    expect(space).to respond_to(:price)
  end

  it "has a description" do
    expect(space).to respond_to(:description)
  end
end
