require 'spec_helper'

feature 'User sign up' do
  scenario 'Users can sign up as a new user' do
    visit '/'
    click_button 'Sign up'
    fill_in :email,  with: 'alice@example.com'
    click_button 'Create account' 
    expect { sign_up }.to change(User, :count).by(1)
    expect(page).to have_content('Welcome, alice@example.com')
    expect(User.first.email).to eq('alice@example.com')
  end
end
