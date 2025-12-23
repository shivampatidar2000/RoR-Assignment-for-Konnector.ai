require "rails_helper"

RSpec.describe Admin::CreateAdminController, type: :controller do
  describe "POST #create" do
    it "creates admin user" do
      post :create, params: {
        user: {
          name: "Admin",
          email: "admin@test.com",
          password: "password123",
          password_confirmation: "password123"
        }
      }

      expect(response).to have_http_status(:created)
      expect(User.last.admin?).to be true
    end
  end
end
