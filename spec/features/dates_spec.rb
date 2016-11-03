require 'spec_helper'

feature 'See existing dates' do

  let!(:user) do
    User.create(email: 'bnb@makers.com', password: '123456',
                password_confirmation: '123456')
  end

  scenario 'can add in dates' do
    sign_in(email: user.email, password: user.password)
    visit 'spaces/new'
    fill_in 'name', with: 'Makers'
    fill_in 'address', with: 'Commerical road'
    fill_in 'postcode', with: 'E15X'
    fill_in 'price', with: 25
    fill_in 'day', with: '01.07'
    click_button "Post property"

    space = Space.first

    expect(space.calendars.map(&:day)).to include('01.07')
 end
end

feature 'filter dates' do

  before(:each) do
    Space.create(name: 'akram house', calendars: [Calendar.first_or_create(day: '01.08')])
    Space.create(name: 'Dagmara house', calendars: [Calendar.first_or_create(day: '01.09')])
  end
  scenario 'I can filter by date' do
    sign_up
    visit '/spaces'

    fill_in :day, with: '01.08'
    click_button 'filter'

    expect(page).to have_content('akram house')
    expect(page).not_to have_content('Dagmara house')

  end
end
