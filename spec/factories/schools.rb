FactoryBot.define do
  factory :school do
    name { 'ABC School' }
    address { 'Indore' }
    association :school_admin, factory: [ :user, :school_admin ]
  end
end
