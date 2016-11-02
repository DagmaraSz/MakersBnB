
def sign_up
  visit '/'
  fill_in :email_signup, with: 'tester1@tester.com'
  fill_in :password_signup, with: 123456
  fill_in :password_confirmation, with: 123456
  click_button 'Create account'
end

def sign_up_invalid_address
  visit '/'
  fill_in :email_signup, with: 'tester1.com'
  fill_in :password_signup, with: 123456
  fill_in :password_confirmation, with: 123456
  click_button 'Create account'
end

def sign_up_invalid_password
  visit '/'
  fill_in :email_signup, with: 'tester1@tester.com'
  fill_in :password_signup, with: 123456
  fill_in :password_confirmation, with: 123452
  click_button 'Create account'
end

def sign_in(email:, password:)
  visit '/'
  fill_in :email, with: email
  fill_in :password, with: password
  click_button 'Log in'
end
