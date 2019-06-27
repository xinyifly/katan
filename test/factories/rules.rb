FactoryBot.define do
  factory :rule do
    key { Rule.keys.values.sample }
    value { Faker::Internet.slug }
    poll
  end
end
