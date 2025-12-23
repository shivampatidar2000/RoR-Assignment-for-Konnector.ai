FactoryBot.define do
  factory :user do
    name { Faker::Name.name }
    email { Faker::Internet.unique.email }
    password { 'password123' }
    password_confirmation { 'password123' }

    trait :admin do
      role { 'admin' }
    end

    trait :school_admin do
      role { 'school_admin' }
    end

    trait :student do
      role { 'student' }
    end
  end
end
