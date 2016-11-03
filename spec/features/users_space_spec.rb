require 'spec_helper'

feature 'Space has owner' do

  let!(:user) do
    User.create(email: 'bnb@makers.com', password: '123456',
                password_confirmation: '123456')
  end

  scenario 'and his name appears on list of spaces' do
    sign_in(email: user.email, password: user.password)
    visit 'spaces/new'
    fill_in 'name', with: 'Makers'
    fill_in 'address', with: 'Commerical road'
    fill_in 'postcode', with: 'E15X'
    fill_in 'price', with: 25
    fill_in 'day', with: '01/07'
    click_button "Post property"

    space = Space.first

    expect(space.calendars.map(&:day)).to include('01/07')
    expect(page).to have_content("Posted by bnb@makers.com")

 end
end
