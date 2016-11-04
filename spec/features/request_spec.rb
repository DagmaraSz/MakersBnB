require 'spec_helper'

feature 'Request message' do

  let!(:user) do
    User.create(email: 'bnb@makers.com', password: '123456',
                password_confirmation: '123456')
  end

  let!(:space) do
    Space.create(name: 'Katy house',address: 'Commercial road', postcode: 'E17', price: 500, calendars: [Calendar.first_or_create(day: '03.10')], owner: 'bnb@makers.com')
  end

  scenario 'will inform user that no requests were made' do
    sign_in(email: user.email, password: user.password)
    booking = Booking.new(confirmed: false, requester: "Jeff", space: space)
    p Space.all
    p space
    expect(booking.requester).to eq "Jeff"
    expect(booking.space.owner).to eq "bnb@makers.com"
    # expect(current_path).to eq '/spaces'
    # expect(page).to have_content("no space requests made")
  end
end
