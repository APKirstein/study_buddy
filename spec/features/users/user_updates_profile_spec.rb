require 'rails_helper'

feature 'user edits their login information', %{
  As an authenticated user
  I want to update my profile
  So I can display the latest information
} do

  # Acceptance criteria:
  # [ ] - If I am logged in I can see a link to edit my profile as a dropdown
  # [ ] - When I click on the link, I can edit my information via form
  # [ ] - The form is populated with my current info with the password as stars
  # [ ] - When I submit the form, my information is updated
  # [ ] - I will see a confirmation on my profile page when form is submitted

  let!(:user) { FactoryGirl.create(:user) }

  scenario 'authenticated user edits profile information' do
    sign_in_as(user)

    expect(page).to have_content('Signed in successfully')

    visit edit_user_registration_path

    fill_in 'Username', with: 'nocturnal'
    fill_in 'Current password', with: user.password
    click_button 'Update'

    expect(page).to have_content('nocturnal')
    expect(page).to have_content('Your account has been updated successfully')
  end

end
