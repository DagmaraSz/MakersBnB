require 'spec_helper'

feature 'request button' do

  before(:all) do
    let(:user) {double(email: "akram@gmail.com", password: "123456")}
    p user
    sign_up(email: user.email, password: user.password)
    log_out
    let(:owner) {double(email: "bob@gmail.com", password: "123456")}
    sign_up(email: owner.email, password: owner.password)
    add_property
    log_out
  end
  scenario 'allows you to request a space' do
    sign_in(email: user.email, password: user.password)
    expect{click_button 'Request booking'}.to change(Booking, :count).by(1)
    expect(page).to have_content("Requested")
    expect(Booking.last.requester).to eq user.email
    expect(Booking.last.space.name).to eq 'Makers'
  end

  scenario 'allows owner to see when a place has been requested' do
    sign_in(email: owner.email, password: owner.password)
    #page reference ????
    expect(page).to have_content("Requested")
  end
end
