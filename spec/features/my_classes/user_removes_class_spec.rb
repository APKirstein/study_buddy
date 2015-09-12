require "rails_helper"

feature "User removes class from list", %{
  As a user
  I want to remove a class from my list
  So that I can keep my schedule up to date
} do

  # Acceptance Criteria:
  # [ ] - I must be logged in
  # [ ] - I can see the list of all my classes
  # [ ] - When I click on the delete button it removes the class

  let!(:user) { FactoryGirl.create(:user) }
  let!(:section) { FactoryGirl.create(:section) }
  let!(:my_class) { FactoryGirl.create(:my_class, user: user.id, section: section.id) }

  scenario "user removes class" do
    sign_in_as(user)
    visit sections_path
    click_button "Remove"

    expect(page).to have_content("Successfully removed")
    expect(page).to_not have_content(my_class.section)
  end

end
