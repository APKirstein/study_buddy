require "rails_helper"

feature "user adds a class to their list", %{
  As a user
  I want to add the classes I am taking
  So that I can get a study schedule for them
} do

  # Acceptance Criteria:
  # [ ] - I must be logged in
  # [ ] - I can see a list of all the classes with add buttons
  # [ ] - I can click on the button to add it to my list
  # [ ] - I am prompted that the creation was successful

  let!(:user) { FactoryGirl.create(:user) }
  let!(:section) { FactoryGirl.create(:section) }

  scenario "user adds class to list" do
    sign_in_as(user)
    visit sections_path
    click_button "Add"

    expect(page).to_not have_content("Add")

    visit my_classes_path

    expect(page).to have_content(section.name)
  end

  scenario "non-user visits index" do
    visit sections_path

    expect(page).to_not have_content("Add")
    expect(page).to have_content(section.name)
  end
end
