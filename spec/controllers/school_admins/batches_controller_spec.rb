require "rails_helper"

RSpec.describe SchoolAdmins::BatchesController, type: :controller do
  let(:school_admin) { create(:user, :school_admin) }
  let(:course) { create(:course) }

   before do
    authenticate(school_admin)
  end
  it "creates batch" do
    post :create, params: {
      batch: {
        name: "Batch A",
        course_id: course.id,
        start_date: Date.today,
        end_date: Date.today + 1.month
      }
    }

    expect(response).to have_http_status(:created)
  end
end
