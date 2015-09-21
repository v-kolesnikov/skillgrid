def sign_in(email, password)
  visit signin_path
  fill_in :session_email, with: email
  fill_in :session_password, with: password
  click_on "Sign In"
end
