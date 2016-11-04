require 'spec_helper'
require './app/models/space.rb'

feature 'spaces' do

  let!(:user) do
    User.create(email: 'bnb@makers.com', password: '123456',
                password_confirmation: '123456')
  end

  scenario "it creates and lists spaces" do
    sign_in(email: user.email, password: user.password)
    visit '/spaces/new'
    fill_in 'name', with: '2 bedroom flat'
    fill_in 'address', with: 'liverpool street'
    fill_in 'postcode', with: 'W1 5ux'
    fill_in 'price', with: '350'
    click_button "Post property"
    expect{click_button 'Post property'}.to change(Space, :count).by(1)
    expect(current_path).to eq '/spaces'
    expect(page).to have_content("liverpool street")
  end

  scenario "/spaces has a link to add a new space" do
    sign_in(email: user.email, password: user.password)
    visit '/spaces'
    click_link 'create_space'
    expect(current_path).to eq '/spaces/new'
  end

  scenario "/spaces/new has a link to view all listed spaces" do
    sign_in(email: user.email, password: user.password)
    visit '/spaces/new'
    click_link 'listed_spaces'
    expect(current_path).to eq '/spaces'
  end
end
