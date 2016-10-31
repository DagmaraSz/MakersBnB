require 'spec_helper'

describe Space do
  subject(:space) {described_class.new}
  it "has a name" do
    expect(space).to respond_to(:name)
  end
end
