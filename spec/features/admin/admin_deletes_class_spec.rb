require "rails_helper"

feature "admin deletes a class", %{
  As an admin
  I want to be able to delete a class
  Once it has happened or been cancelled
} do

  # Acceptance Criteria:
  # [ ] - I must be logged in
  # [ ] - I can see an edit for all classes
  # [ ] - Once I am on the edit class page I can see a delete button
  # [ ] - Once deleted I am given notice and redirected

  let!(:admin) { FactoryGirl.create(:user, admin: true) }
  let!(:user) { FactoryGirl.create(:user) }
  let!(:section) { FactoryGirl.create(:section, user_id: :user) }

  scenario "admin deletes a class" do
    sign_in_as(admin)
    visit sections_path
    click_link "Edit"

    expect(page).to have_content("Delete")
    click_link "Delete"

    expect(page).to_not have_content(section.name)
    expect(page).to have_content("Successfully deleted")
  end

  scenario "user does not see delete" do
    sign_in_as(user)
    visit sections_path
    expect(page).to have_content("Edit")

    click_link "Edit"

    expect(page).to have_content("Submit")
    expect(page).to_not have_content("Delete")
  end

end
