require 'spec_helper'

feature 'User sign up' do
  scenario 'Users can sign up as a new user' do
    visit '/'
    expect(page).to have_content('Welcome to MakersBnB')
    expect(page).to have_content('Sign up here')
    expect(page).to have_button('Create account')
  end
  scenario 'User is added to the database' do
    expect{sign_up}.to change(User, :count).by(1)
  end

  scenario 'user tries to sign_up with invalid email address' do
    expect{sign_up_invalid_address}.to change(User, :count).by(0)
  end
end
