require 'rails_helper'

feature 'user signs in', %Q{
  As a signed up user
  I want to sign in
  So that I can regain access to my account
} do

  # Acceptance Criteria:
  # [ ] - I can click on the sign in link
  # [ ] - I am brought to a sign in form
  # [ ] - Upon submission of the form I am signed in

  scenario 'specify valid credentials', focus: true do
    user = FactoryGirl.create(:user)

    visit new_user_session_path

    sign_in_as(user)

    expect(page).to have_content('Signed in successfully')
    expect(page).to have_content('Sign Out')
  end

  scenario 'specify invalid credentials' do
    visit new_user_session_path

    click_button 'Log in'
    expect(page).to have_content('Invalid email or password')
    expect(page).to_not have_content('Sign Out')
  end
end
