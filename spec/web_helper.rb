
def sign_up
  visit '/'
  fill_in :email_signup, with: 'tester1@tester.com'
  fill_in :password_signup, with: '123456'
  fill_in :password_confirmation, with: '123456'
  click_button 'Create account'
end
