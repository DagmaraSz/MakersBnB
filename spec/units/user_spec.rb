require 'spec_helper'

describe User do

  let!(:user) do
    User.create(email: "bob@example.com", password: "password",
                password_confirmation: "password")
  end

  it "should include the :email attribute" do
    expect(user.attributes).to include(:email)
  end

  it "should include the :password_digest attribute" do
    expect(user.attributes).to include(:password_digest)
  end

  it "authenticates when given a valid email and password" do
    authenticated_user = User.authenticate(user.email, "password")
    expect(authenticated_user).to eq user
  end

  it "does not authentiacte when given wrong password" do
    expect(User.authenticate(user.email, 'bad_password')).to be_nil
  end

  it "requires a valid email address" do
    expect{User.create(email: "makers.com", password: "password")}.to change(User, :count).by(0)
  end

  it "email address can only be registered once" do
    User.create(email: "tom@example.com", password: "password")
    expect{User.create(email: "tom@example.com", password: "password")}.to change(User, :count).by(0)
  end

  it "stops you from setting a password of less than 6 characters" do
    expect{User.create(email: "makers@example.com", password: "abcd")}.to change(User, :count).by(0)
  end
end
