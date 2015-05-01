require 'faker'

namespace :db do

	desc "fill the database with sample data"

		task :populate => :environment do
			Rake::Task['db:reset'].invoke
			User.create!(:name 		=> "Example User",
						 :email 	=> "example@example.edu",
						 :password  => "testpassword",
						 :password_confirmation => "testpassword")
			99.times do |n|
				name = Faker::Name.name
				email = "example-#{n+1}@abv.bg"
				password = "testpassword"
				User.create!(:name 		=> name,
							 :email 	=> email,
							 :password  => password,
							 :password_confirmation => password)
			end
	end
	
end