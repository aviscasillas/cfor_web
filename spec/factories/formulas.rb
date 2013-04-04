require 'faker'

FactoryGirl.define do
	factory :formula do |f|
		f.name {Faker::Name.name}
		f.expression {Faker::Lorem.characters}
	end	
end