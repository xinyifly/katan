FactoryBot.define do
  factory :user, aliases: [:candidate, :voter] do
    email { Faker::Internet.email }
    password { Faker::Internet.password }
  end
end
