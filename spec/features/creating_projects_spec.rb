require 'spec_helper'

feature 'Creating Projects' do
    scenario "can create a project" do
        visit '/'

		click_link 'New Project'

		fill_in 'Name', with: 'nano'
		fill_in 'Description', with: 'A text editor for linux'
		click_button 'Create project'

		expect(page).to have_content('Project has been created.')

		project = Project.where(name: "nano").first
		expect(page.current_url).to eql(project_url(project))
		title = "nano - Ticketee"
		expect(page).to have_title(title)
    end
end

