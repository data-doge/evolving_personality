class PagesController < ApplicationController

	# before_action :authenticate_user!

	def home
		redirect_to new_user_session_path unless user_signed_in?
	end

	def questionnaire
    if current_user.questionnaire_complete?
      @questionnaire = Questionnaire.create_partial_for(current_user)
    else
  		@questionnaire = Questionnaire.create_full_for(current_user)
    end
	end

end

