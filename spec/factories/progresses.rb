FactoryBot.define do
  factory :progress do
    user { association :user, :student }
    batch
    score { 85 }
    remarks { 'Good performance' }
  end
end
