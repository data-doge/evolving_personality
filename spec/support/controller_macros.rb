module ControllerMacros

  def login_user
    before(:each) do
      @request.env["devise.mapping"] = Devise.mappings[:user]
      @current_user = User.create(email: "eugenestapler@gmail.com", password: "password")
      sign_in @current_user
    end
  end
  
end