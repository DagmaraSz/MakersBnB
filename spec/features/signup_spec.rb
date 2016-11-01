require 'spec_helper'

feature 'User sign up' do
  scenario 'Users can sign up as a new user' do
    visit '/'
    expect(page).to have_content('Sign up to MakersBnB')
  end
end
