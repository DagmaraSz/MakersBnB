require 'spec_helper'
require './app/models/space.rb'

feature 'create space' do
  scenario "it creates and lists space at home" do
    sign_in
    visit '/spaces/new'
    fill_in 'name', with: '2 bedroom flat'
    fill_in 'address', with: 'liverpool street'
    fill_in 'postcode', with: 'W1 5ux'
    fill_in 'price', with: '350'
    click_button 'Post property'
    expect(current_path).to eq '/spaces'
    expect(page).to have_content("liverpool street")
  end
end
