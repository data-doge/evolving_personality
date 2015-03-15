class UsersController < ApplicationController

	before_action :authenticate_user!

	def update
		answers = params[:answers]
		current_user.update_binary_string_with(answers)
		Examiner.prepare_for(current_user)
		@record = current_user.records.last
		redirect_to "/"
	end

  def history
    current_user.history
  end

end

