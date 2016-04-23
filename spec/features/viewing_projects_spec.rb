require "spec_helper"

feature "Viewing projects" do
	scenario "Listing all projects" do
		project = FactoryGirl.create(:project, name: "nano")

		visit '/'
		click_link "nano"
		expect(page.current_url).to eql(project_url(project))
	end
end

