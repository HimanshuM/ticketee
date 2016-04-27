require 'rails_helper'

#RSpec.describe User, :type => :model do
#  pending "add some examples to (or delete) #{__FILE__}"
#end

describe User do
	describe "passwords" do
		it "needs a password and confirmation to save" do
			u = User.new name: "suyog"

			u.save
			expect(u).to_not be_valid

			u.password = "malpande"
			u.password_confirmation = ""
			u.save
			expect(u).to_not be_valid

			u.password_confirmation = "malpande"
			u.save
			expect(u).to be_valid
		end

		it "needs password and confirmation to match" do
			u = User.create name: "suyog", password: "malpande", password_confirmation: "malpand"
			u.save
			expect(u).to_not be_valid
		end
	end

	describe "authentication" do
		let(:user) { User.create name: "suyog", password: "malpande", password_confirmation: "malpande" }

		it "authenticates with correct password" do
			expect(user.authenticate("malpande")).to be
		end

		it "does not authenticate with incorrect password" do
			expect(user.authenticate("malpand")).to_not be
		end
	end
end
