FactoryBot.define do
  factory :enrollment do
    user { association :user, :student }
    batch
    status { 'pending' }
  end
end
