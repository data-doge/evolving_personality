module ControllerMacros

  def login_user
    before do
      @request.env["devise.mapping"] = Devise.mappings[:user]
      @current_user = User.create(email: Faker::Internet.email, password: "password")
      sign_in @current_user
    end
  end
  
end