FactoryBot.define do
  factory :batch do
    name { 'Batch A' }
    start_date { Date.today }
    end_date { Date.today + 3.months }
    course
  end
end
