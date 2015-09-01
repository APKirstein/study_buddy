require 'rails_helper'

feature 'user creates a new class', %{
  As an authenticated user
  I want to create a new class
  So that I and others can join it
} do

  # Acceptance Criteria:
  # [ ] - When I'm signed in, I have an option for "Create New Class"
  # [ ] - When I click on the link I am brought to the create new class page
  # [ ] - While on this page I can submit a form for the new class
  # [ ] - When I submit the form I am brought to its show page

  let!(:user) { FactoryGirl.create(:user) }

  scenario 'user creates a new class' do
    sign_in_as(user)

    visit root_path
    expect(page).to have_content('New Class')

    click_link 'New Class'

    fill_in 'Name', with: 'The Queer Scholar'
    fill_in 'Subject', with: 'Gender Law'
    fill_in 'Professor', with: 'Allen'
    fill_in 'Time', with: 'Thursday, 4:00'
    fill_in 'Location', with: 'David J. Sargent Hall'

    click_button 'Submit'

    expect(page).to have_content('Allen')
    expect(page).to have_content('Gender Law')
  end

  scenario 'user creates invalid new class' do
    sign_in_as(user)

    visit root_path
    click_link 'New Class'

    fill_in 'Name', with: 'The Queer Scholar'
    fill_in 'Professor', with: 'Allen'
    fill_in 'Time', with: 'Thursday, 4:00'
    fill_in 'Location', with: 'David J. Sargent Hall'

    click_button 'Submit'

    expect(page).to have_content("Subject can't be blank")
  end

  scenario 'non-user clicks link' do
    visit root_path
    click_button 'New Class'

    expect(page).to have_content("You must be logged in")
  end

end
