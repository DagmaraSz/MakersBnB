require 'spec_helper'
require './app/models/space.rb'

feature 'create space' do

  let!(:user) do
    User.create(email: 'bnb@makers.com', password: '123456',
                password_confirmation: '123456')
  end

  scenario "it creates and lists space at home" do
    sign_in(email: user.email, password: user.password)
    visit '/spaces/new'
    fill_in 'name', with: '2 bedroom flat'
    fill_in 'address', with: 'liverpool street'
    fill_in 'postcode', with: 'W1 5ux'
    fill_in 'price', with: '350'
    expect{click_button 'Post Property'}.to change(Space, :count).by(1)
    expect(current_path).to eq '/spaces'
    expect(page).to have_content("liverpool street")
  end
end
