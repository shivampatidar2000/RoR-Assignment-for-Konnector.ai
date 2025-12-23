require "rails_helper"

RSpec.describe School, type: :model do
  it { should belong_to(:school_admin).class_name("User") }
  it { should validate_presence_of(:name) }
end
