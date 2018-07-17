FactoryBot.define do
  factory :developer do
    first_name { |n| generate :string }
    last_name { |n| generate :string }
    email
  end
end
