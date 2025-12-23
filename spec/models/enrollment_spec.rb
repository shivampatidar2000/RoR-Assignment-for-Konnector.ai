require "rails_helper"

RSpec.describe Enrollment, type: :model do
  it { should define_enum_for(:status) }
  it { should belong_to(:user) }
  it { should belong_to(:batch) }

  it "prevents duplicate enrollment" do
    enrollment = create(:enrollment)
    duplicate = build(:enrollment, user: enrollment.user, batch: enrollment.batch)
    expect(duplicate).not_to be_valid
  end
end
