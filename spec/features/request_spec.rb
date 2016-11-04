require 'spec_helper'

feature 'Bookings,' do

  let!(:user) do
    User.create(email: 'bnb@makers.com', password: '123456',
                password_confirmation: '123456')
  end

  let!(:space) do
    Space.create(name: 'Katy house',address: 'Commercial road', postcode: 'E17', price: 500, calendars: [Calendar.first_or_create(day: '03.10')], owner: 'bnb@makers.com')
  end

  let!(:space_2) do
    Space.create(name: 'Dio house',address: 'Commercial road', postcode: 'E17', price: 500, calendars: [Calendar.first_or_create(day: '03.10')], owner: 'notbnb@makers.com')
  end

  before(:each) do
    sign_in(email: user.email, password: user.password)
  end

  scenario 'holds a space' do
    booking = Booking.create(confirmed: false, requester: "Jeff", space: space)
    expect(booking.space).to eq space
  end

  scenario 'can be made holding a requester' do
    booking = Booking.create(confirmed: false, requester: "Jeff", space: space)
    expect(booking.requester).to eq "Jeff"
  end

  scenario 'holds a space that has all properties, eg: owner' do
    booking = Booking.create(confirmed: false, requester: "Jeff", space: space)
    expect(booking.space.owner).to eq "bnb@makers.com"
  end

  feature 'owner is notified whether a request' do
    scenario 'was not made', focus: true do
      space_3 = Space.create(name: 'Dio house',address: 'Commercial road', postcode: 'E17', price: 500, calendars: [Calendar.first_or_create(day: '03.10')], owner: 'notnotbnb@makers.com')
      booking = Booking.create(confirmed: false, requester: "Jeff", space: space_3)
      p Booking.all
      p Booking.all.space
      p Booking.all.space[0][:owner]
      # p booking.space
      expect(page).to have_content 'No request were made on your spaces'
    end
    scenario 'was made' do
      expect(page).to have_content 'You have a space request'
    end
  end

end
