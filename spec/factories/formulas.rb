require 'faker'

FactoryGirl.define do
  factory :formula do |f|
    f.name {Faker::Name.name}
    f.expression {Faker::Lorem.characters}
  end
  factory :invalid_formula, parent: :formula do |f|
    f.name nil
  end
end
