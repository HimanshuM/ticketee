require "spec_helper"

feature "Editing Projects" do

	before do
		FactoryGirl.create :project, name: "nano"
		visit "/"
		click_link "nano"
		click_link "Edit project"
	end
		
	scenario "Updating a project" do
		fill_in "Name", with: "nano (beta)"
		click_button "Update project"

		expect(page).to have_content("Project has been updated successfully.")
	end

	scenario "Updating a project with invalid attributes is bad" do
		fill_in "Name", with: ""
		click_button "Update project"

		expect(page).to have_content "Failed to update project"
	end
end
