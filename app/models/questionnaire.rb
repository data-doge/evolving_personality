class Questionnaire

	def self.create_for(user)
		questions = []
		user.binary_string.split("").each_with_index do |bit, index|
			questions << Question.find_by(uid: index) if bit == "x"
		end 
		return questions
	end

	# def self.update_for(user)

	# end

end