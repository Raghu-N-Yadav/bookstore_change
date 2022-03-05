FactoryBot.define do
  factory :student do
    name { Faker::Name.name }
    email { Faker::Internet.safe_email  }
  end

end
