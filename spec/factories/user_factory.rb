FactoryGirl.define do
	factory :user do
		name "himanshu"
		email "sample@example.com"
		password "himanshu"
		password_confirmation "himanshu"

		factory :admin_user do
			admin true
		end
	end
end
