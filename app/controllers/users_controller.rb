class UsersController < ApplicationController

	before_action :authenticate_user!

	def update
		user = current_user
		# params.require(:answers).permit!
		answers = params[:answers]
		new_string = user.return_updated_binary_string_with(answers)
		puts "MEOWMEOWMEOWMEOWMEOWMEOWMEOWMEOWMEOWMEOWMEOWMEOWMEOWMEOWMEOWMEOWMEOWMEOWMEOWMEOWMEOWMEOWMEOWMEOW"
		user.update(binary_string: "444444444444444444444444444444444444444444444444")
		# current_user.save
		# update user's binary string
		# examine that fucker
		redirect_to "/"
	end		

end

