require "rails_helper"
RSpec.describe Students::EnrollmentsController, type: :controller do
  let(:student) { create(:user, :student) }
  let(:batch) { create(:batch) }

  before do
    authenticate(student)
  end

  it "creates enrollment request" do
    post :create, params: {
      enrollment: { batch_id: batch.id }
    }
    expect(Enrollment.last.status).to eq("pending")
  end
end
