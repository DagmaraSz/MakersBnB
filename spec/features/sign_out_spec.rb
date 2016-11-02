require 'spec_helper'

feature 'User logs out' do

  let!(:user) do
    User.create(email: 'bnb@makers.com', password: '123456',
                password_confirmation: '123456')
  end

  scenario 'while being signed in' do
    sign_in(email: user.email, password: user.password)
    click_button 'Log out'
    expect(page.current_path).to eq '/'
  end

  scenario 'while being signed in' do
    sign_in(email: user.email, password: user.password)
    click_button 'Log out'
    expect(page).to have_content('goodbye!')
    expect(page).not_to have_content('Welcome, test@test.com')
  end

end
