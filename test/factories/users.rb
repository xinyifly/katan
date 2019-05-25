FactoryBot.define do
  factory :user, aliases: [:candidate] do
    email { Faker::Internet.email }
    password { Faker::Internet.password }
  end
end
