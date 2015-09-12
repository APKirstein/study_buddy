require 'rails_helper'

feature 'user deletes their account', %{
  As an authenticated user
  I want to delete my account
  So I can discontinue using this service
} do

  # Acceptance Criteria:
  # [ ] - If I'm signed in, I should see a link to edit my profile as a drop down
  # [ ] - When I click the link, I am brought to the edit page
  # [ ] - When I click on the button to delete my account I reveice a confirmation that my account has been removed
  # [ ] - I am therefore, no longer signed into my account

  let!(:user) { FactoryGirl.create(:user) }

  scenario 'user deletes account' do
    sign_in_as(user)

    visit edit_user_registration_path

    click_button 'Cancel my account'

    expect(page).to have_content('Bye! Your account has been successfully cencelled.')
    expect(page).to have_content('Sign Up')
  end

end
