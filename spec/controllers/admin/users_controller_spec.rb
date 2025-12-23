require "rails_helper"

RSpec.describe Admin::UsersController, type: :controller do
  let(:admin) { create(:user, :admin) }


  before do
    authenticate(admin)
  end

  it "creates school admin" do
    post :create_school_admin, params: {
      user: {
        name: "School Admin",
        email: "school@test.com",
        password: "password123",
        password_confirmation: "password123"
      }
    }

    expect(response).to have_http_status(:created)
    expect(User.last.school_admin?).to be true
  end
end
