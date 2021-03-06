require 'rails_helper'

describe ProjectsController do
	it "displays an error for missing project" do
		get :show, id: "not-here"
		expect(response).to redirect_to(projects_path)
		message = "The project you were looking for does not exist"
		expect(flash[:alert]).to eql(message)
	end
end
