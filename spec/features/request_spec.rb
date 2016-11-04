require 'spec_helper'

feature 'request button' do

  let!(:space) do
    Space.create(name: 'Dio', address: 'Commercial road', postcode: 'N1', price:600, calendars: [Calendar.first_or_create(day: '22.03')], owner: 'dio@makers.com')
  end

  let!(:user) do
    User.create(email: 'bnb@makers.com', password: '123456',
                password_confirmation: '123456')
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
