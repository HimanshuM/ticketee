require 'rails_helper'
require "support/authentication_helpers"

feature 'Creating Projects' do

	before do
		visit '/'
		sign_in_as! FactoryGirl.create :admin_user

		click_link 'New Project'
	end

    scenario "can create a project" do
		fill_in 'Name', with: 'nano'
		fill_in 'Description', with: 'A text editor for linux'
		click_button 'Create project'

		expect(page).to have_content('Project has been created.')

		project = Project.where(name: "nano").first
		expect(page.current_url).to eql(project_url(project))
		title = "nano - Ticketee"
		expect(page).to have_title(title)
    end

	scenario "can not create a project without a name" do
		click_button 'Create project'
		
		expect(page).to have_content("Project has not been created.")
		expect(page).to have_content("Name can't be blank")
	end

end
