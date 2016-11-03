require 'spec_helper'

feature 'filtering properties' do

  before(:each) do
    Space.create(name: 'Dionysis house', address: 'Commercial road', postcode: 'E17', price: 500, calendars: [Calendar.first_or_create(day: '02.09')], owner: 'dionysis@gmail.com')
    Space.create(name: 'Katy house',address: 'Commercial road', postcode: 'E17', price: 500, calendars: [Calendar.first_or_create(day: '03.10')], owner: 'katy@gmail.com')
  end

  scenario 'I can filter by owner' do
    sign_up
    visit '/spaces'

    fill_in :owner, with: 'dionysis@gmail.com'
    click_button 'filter by owner'

    expect(page).to have_content('Dionysis house')
    expect(page).not_to have_content('Katy house')
  end
end
