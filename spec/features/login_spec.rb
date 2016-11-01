require 'spec_helper'

feature 'User log in' do
  scenario 'An existing user can log in' do
    visit '/'
    expect(page).to have_content('Welcome to MakersBnB')
    expect(page).to have_content('Log in here')
    expect(page).to have_button('Log in')
  end
end
