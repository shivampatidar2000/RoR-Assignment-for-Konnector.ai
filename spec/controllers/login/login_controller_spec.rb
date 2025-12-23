require "rails_helper"

RSpec.describe Login::LoginController, type: :controller do
  let!(:user) { create(:user, role:"admin", email: "test@test.com", password: "password123") }

  it "logs in user" do
    post :create, params: { email: "test@test.com", password: "password123" }

    expect(response).to have_http_status(:ok)
  end
end
