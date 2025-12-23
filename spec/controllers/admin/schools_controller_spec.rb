require "rails_helper"

RSpec.describe Admin::SchoolsController, type: :controller do
  let(:admin) { create(:user, :admin) }
  let(:school_admin) { create(:user, :school_admin) }

  before do
    authenticate(admin)
  end

  it "creates school" do
    post :create, params: {
      school: {
        name: "ABC School",
        address: "Indore",
        school_admin_id: school_admin.id
      }
    }

    expect(response).to have_http_status(:created)
    expect(School.count).to eq(1)
  end
end
