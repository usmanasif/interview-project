require 'faker'

FactoryBot.define do
  factory :author do
    name { Faker::Name.name }
    email  { Faker::Internet.safe_email }
    gender { Faker::Gender.binary_type }
    address { Faker::Address.full_address }
  end

  factory :book do
    isbn { Faker::Code.isbn }
    title  { Faker::Book.title }
    number_of_pages { Faker::Number.between(1, 500) }

    trait :with_authors do
      after(:create) do |post|
        create_list :authors, 5
      end
    end
  end
end
