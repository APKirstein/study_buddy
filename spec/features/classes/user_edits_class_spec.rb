require 'rails_helper'

feature 'User updates class info', %{
  As an authenticated User
  I want to update class information from a class I submitted
  To reflect the change in time
} do

  # Acceptance Criteria:
  # [ ] - When I'm signed in I see an edit button for the classes I created
  # [ ] - When I click on the button I am brought to an edit class form
  # [ ] - When I'm done and click submit, the edited information is visible

  let!(:user) { FactoryGirl.create(:user) }
  let!(:class) { FactoryGirl.create(:class, user: user.id) }

  scenario 'user edits a class' do
    sign_in_as(user)

    visit root_path
    expect(page).to have_content('Edit')

    click_button 'Edit'

    fill_in "time", with: "Friday, 10:00AM"
    click_button "Submit"

    expect(page).to have_content("Friday, 10:00AM")
  end

  scenario 'user edits class incorrectly' do
    sign_in_as(user)

    visit root_path
    click_button 'Edit'

    fill_in "time", with: 10
    expect(page).to have_content("expected a string")
  end

end
