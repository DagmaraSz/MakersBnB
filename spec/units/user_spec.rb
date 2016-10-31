require 'spec_helper'

describe User do

  let!(:user) do
    User.create(email: "makers@example.com")
  end

  it "should include the :email attribute" do
    expect(user.attributes).to include(:email)
  end

  it "requires a valid email address" do
    expect{User.create(email: "makers.com")}.to change(User, :count).by(0)
  end

  it "email address can only be registered once" do
    User.create(email: "makers@example.com")
    expect{User.create(email: "makers@example.com")}.to change(User, :count).by(0)
  end



end
