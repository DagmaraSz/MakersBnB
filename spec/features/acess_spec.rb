require 'spec_helper'

feature 'Prevent access to listings' do
  scenario "doesn't allow non-logged in members to see listings" do
    visit ('/spaces')
    expect(page.current_path).to eq '/'
  end
  scenario "allows logged in users to access listings" do
    sign_in
    visit ('/spaces')
    expect(page.current_path).to eq '/spaces'
  end
end
