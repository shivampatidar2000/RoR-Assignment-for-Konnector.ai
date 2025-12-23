require "rails_helper"

RSpec.describe SchoolAdmins::CoursesController, type: :controller do
  let(:school_admin) { create(:user, :school_admin) }
  let(:school) { create(:school, school_admin: school_admin) }

  before do
    authenticate(school_admin)
  end
  it "creates course" do
    post :create, params: {
      course: {
        name: "Maths",
        description: "Basic",
        school_id: school.id
      }
    }

    expect(response).to have_http_status(:created)
  end
end
