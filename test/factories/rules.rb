FactoryBot.define do
  factory :rule do
    key { Faker::Internet.slug }
    value { Faker::Internet.slug }
    poll
  end
end
