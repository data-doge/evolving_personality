require 'rails_helper'
require 'faker'

RSpec.describe PagesController, :type => :controller do 

	describe "#home" do 

		describe "if user signed in" do 

			login_user
			before { get :home }

			it "returns http status of ok" do 
				expect(response).to have_http_status(:ok)
			end 

			it "renders home" do 
				expect(response).to render_template(:home)
			end

		end 

	end

end