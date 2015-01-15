require 'rails_helper'
require 'faker'

RSpec.describe PagesController, :type => :controller do 

	describe "#home" do 

		describe "if user signed in" do 

			before do 
				sign_in 
				get :home
			end 

			it "returns http status of ok" do 
				expect(response).to have_http_status(:ok)
			end 

			it "renders home" do 
				expect(response).to render_template(:home)
			end

		end

		describe "if user not signed in" do 

			before do 
				sign_in nil
				get :home
			end 

			it "returns http status of 302" do 
				expect(response).to have_http_status(302)
			end

			it "redirects to new_user_session" do 
				expect(response).to redirect_to('/users/sign_in')
			end 

		end 

	end

end