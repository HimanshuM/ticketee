require 'spec_helper'

feature "Deleting projects" do
	scenario "Deleting a project" do
		FactoryGirl.create :project, name: "nano"

		visit "/"
		click_link "nano"
		click_link "Delete project"

		expect(page).to have_content "Project has been deleted"

		visit "/"

		expect(page).to have_no_content "nano"
	end
end
