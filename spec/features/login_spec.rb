require 'spec_helper'

feature 'Log in' do

  let!(:user) do
    User.create(email: 'bnb@makers.com', password: '123456',
                password_confirmation: '123456')
  end

  scenario 'form exists on home page' do
    visit '/'
    expect(page).to have_content('Welcome to MakersBnB')
    expect(page).to have_content('Log in here')
    expect(page).to have_button('Log in')
  end

  scenario 'allows user in session to go directly to /spaces' do
    sign_in(email: user.email, password: user.password)
    visit 'www.google.com'
    visit '/'
    expect(page.current_path).to eq '/spaces'
  end

end
