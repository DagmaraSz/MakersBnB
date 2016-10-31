require 'spec_helper'

describe User do

  let!(:user) do
    User.create(email: "makers@example.com")
  end

  it "should include the :email attribute" do
    expect(user.attributes).to include(:email)
  end

end
