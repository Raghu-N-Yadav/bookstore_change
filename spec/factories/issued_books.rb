FactoryBot.define do
  factory :issued_book do
    book { nil }
    student { nil }
    association :book
    association :student
  end
end
