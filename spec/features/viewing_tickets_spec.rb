require "rails_helper"

feature "Viewing tickets" do
	before do
		nano = FactoryGirl.create(:project, name: "nano")
		user = FactoryGirl.create :user
		FactoryGirl.create :ticket, project: nano, title: "Make it shiny", description: "Gradients! Starbursts! Oh my!", user: user
		internet_explorer = FactoryGirl.create :project, name: "Internet Explorer"
		FactoryGirl.create :ticket, project: internet_explorer, title: "Standards compliance", description: "Isn't a joke", user: user

		visit "/"
	end

	scenario "Viewing tickets for a given project" do
		click_link "nano"

		expect(page).to have_content "Make it shiny"
		expect(page).to_not have_content "Standards compliance"

		click_link "Make it shiny"
		within "#ticket h2" do
			expect(page).to have_content "Make it shiny"
		end

		expect(page).to have_content "Gradients! Starbursts! Oh my!"
	end
end
