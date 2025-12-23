require "rails_helper"

RSpec.describe Progress, type: :model do
  it { should belong_to(:user) }
  it { should belong_to(:batch) }
end
