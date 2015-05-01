Factory.define :user do |user|
	user.name					"example user" 
	user.email 					"user@example.com"
	user.password 				"example"
	user.password_confirmation  "example"
end

Factory.sequence :email do |n|
	"person-#{n}@example.com"

end

Factory.define :micropost do |micropost|
	micropost.content "test string"
	micropost.association :user
end