class UsersController < ApplicationController

	before_action :authenticate_user!

	def update
		id = current_user.id
		user = User.find(id)
		answers = params[:answers]
		user.update_binary_string_with(answers)
		# current_user.save
		# update user's binary string
		# examine that fucker
		redirect_to "/"
	end		

end

