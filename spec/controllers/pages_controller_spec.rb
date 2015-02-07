require 'rails_helper'
require 'faker'

RSpec.describe PagesController, :type => :controller do 

	describe "#home" do 

		describe "if user signed in" do 
				
			before do 
				mock_sign_in 
				get :home
			end 

			it { expect(response).to have_http_status(:ok) }
			it { expect(response).to render_template(:home) }

		end

		describe "if user not signed in" do 

			before do 
				mock_sign_in nil
				get :home
			end 

			it { expect(response).to have_http_status(302) }
			it { expect(response).to redirect_to('/users/sign_in') }

		end 

	end

	describe "#questionnaire" do 

		before { get :questionnaire }
		it { expect(response).to have_http_status(:ok) }
		it { expect(response).to render_template(:questionnaire) 
}	end 




end