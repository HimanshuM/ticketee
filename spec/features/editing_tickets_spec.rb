require "rails_helper"
require "support/authentication_helpers.rb"

feature "Editing tickets" do
	let!(:project) { FactoryGirl.create :project }
	let!(:user) { FactoryGirl.create :user }
	let!(:ticket) { FactoryGirl.create :ticket, project: project, user: user }

	before do
		visit "/"
		sign_in_as! user
		click_link project.name
		click_link ticket.title
		click_link "Edit ticket"
	end

	scenario "Updating a ticket" do
		fill_in "Title", with: "Make it really shiny!"
		click_button "Update ticket"

		expect(page).to have_content "Ticket has been updated."

		within("#ticket h2") do
			expect(page).to have_content "Make it really shiny!"
		end

		expect(page).to_not have_content ticket.title
	end

	scenario "Updating a ticket with invalid information" do
		fill_in "Title", with: ""
		click_button "Update ticket"

		expect(page).to have_content "Ticket has not been updated."
	end
end
