class PagesController < ApplicationController

	# before_action :authenticate_user!

	def home 
		redirect_to new_user_session_path unless user_signed_in?
	end

	def questionnaire
		@questionnaire = Questionnaire.create_for(current_user)
	end

end

