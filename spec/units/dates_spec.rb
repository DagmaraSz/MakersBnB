require 'spec_helper'

feature 'See existing dates' do
  scenario 'can add in dates' do
    visit 'spaces/new'
    fill_in 'name', with: 'Makers'
    fill_in 'address', with: 'Commerical road'
    fill_in 'postcode', with: 'E15X'
    fill_in 'price', with: 25
    fill_in 'date', with: 01
    # fill_in 'month', with: 11

    click_button "Post Property"
    p 'hello1'

    space = Space.first
    p 'hello1'
    p space
    p 'hello2'
    expect(space.dates.map(&:date)).to include('Commercial road')
 end
end
