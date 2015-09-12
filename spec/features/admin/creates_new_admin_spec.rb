require 'rails_helper'

feature "admin promotes user", %{
  As an admin
  I have the power to promote people
  Who seem worthy of admin
} do

  # Acceptance Criteria:
  # [ ] - I must be logged in
  # [ ] - I can create a new admin

  let!(:admin) { FactoryGirl.create(:user, admin: true)}
  let!(:user) { FactoryGirl.create(:user) }

  scenario "admin promotes user" do
    sign_in_as(admin)
    visit admin_users_path
    click_button "Make Admin"

    expect(page).to have_content(user.email)
    expect(page).to have_content("admin")
  end

  scenario "unauthorized users are redirected" do
    visit admin_users_path

    expect(page).to have_content("You are not authorized")
    expect(current_path).to eq(root_path)
  end
end
