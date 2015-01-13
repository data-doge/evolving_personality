require 'rails_helper'
require 'faker'

RSpec.describe PagesController, :type => :controller do 

	describe "#home" do 

		describe "if user signed in" do 

			login_user
			before { get :home }

			it "returns http status 302" do 
				expect(response).to have_http_status(302)
			end 

			it "redirects home" do 
				expect(response).to redirect_to("/home")
			end

		end 

	end

end