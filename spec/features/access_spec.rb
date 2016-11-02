require 'spec_helper'

feature 'Prevent access to listings' do

  let!(:user) do
    User.create(email: 'bnb@makers.com', password: '123456',
                password_confirmation: '123456')
  end

  scenario "if user is not logged in" do
    visit ('/spaces')
    expect(page.current_path).to eq '/'
  end

  scenario "unless user is logged in" do
    sign_in(email: user.email, password: user.password)
    expect(page.current_path).to eq '/spaces'
  end

  scenario "using correct sign in details" do
    sign_in(email: user.email, password: user.password)
    expect(page).to have_content "Succesful login, #{user.email}"
  end
end
