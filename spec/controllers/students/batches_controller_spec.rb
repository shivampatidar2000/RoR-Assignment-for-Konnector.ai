require "rails_helper"

RSpec.describe Students::BatchesController, type: :controller do
  let(:student) { create(:user, :student) }
  let(:batch) { create(:batch) }

  before do
    authenticate(student)
    create(:enrollment, batch: batch, user: student)
  end

  it "returns classmates" do
    get :classmates, params: { id: batch.id }

    expect(response).to have_http_status(:ok)
  end
end
