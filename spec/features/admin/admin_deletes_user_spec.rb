require "rails_helper"

feature "admin deletes a user", %{
  As an admin
  I can delete a user
  to protect our site from malicious users
} do

  # Acceptance Criteria:
  # [ ] - I can navigate to a list of all users
  # [ ] - I can click on the button to delete a user
  # [ ] - The user now does not appear in the users list

  scenario "admin deletes a user" do
    admin = FactoryGirl.create(:user, admin: true)
    user = FactoryGirl.create(:user)
    sign_in_as(admin)
    visit admin_users_path
    click_button "Delete User"

    expect(page).to_not have_content(user.username)
    expect(page).to_not have_content("Delete User")
  end

  scenario "admin deletes admin" do
    admin = FactoryGirl.create(:user, admin: true)
    admin2 = FactoryGirl.create(:user, admin: true)
    sign_in_as(admin)
    visit admin_users_path

    expect(page).to_not have_content("Delete User")
    expect(page).to have_content(admin2.username)
  end
end
