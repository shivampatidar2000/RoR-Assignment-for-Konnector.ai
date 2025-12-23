module ControllerAuthHelper
  def auth_headers(user)
    token = JsonWebToken.encode(user_id: user.id)
    {
      "Authorization" => "Bearer #{token}"
    }
  end

  def authenticate(user)
    allow(controller).to receive(:authenticate_user!).and_return(true)
    allow(controller).to receive(:current_user).and_return(user)
  end
end
