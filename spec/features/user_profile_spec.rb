require "rails_helper"

feature "Profile page" do
	scenario "Viewing" do
		user = FactoryGirl.create :user

		visit user_path(user)
		expect(page).to have_content user.name
		expect(page).to have_content user.email
	end
end

feature "Editing Users" do
	scenario "Update profile" do
		user = FactoryGirl.create :user

		visit user_path user
		click_link "Edit profile"

		fill_in "Username", with: "himanshu"
		click_button "Update Profile"

		expect(page).to have_content "Profile has been updated"
	end
end
