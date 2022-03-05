FactoryBot.define do
  factory :book do
    title { "MyString" }
    author { Faker::Alphanumeric.alpha(number: 10)}
    published_in { Faker::Number.within(range: 1800..2020) }
    volume { Faker::Number.between(from: 1, to: 10)  }
  end
end
