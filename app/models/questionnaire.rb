class Questionnaire

	def self.create_full_for(user)
    Question.all
	end

  def self.create_partial_for(user)
    Question.all.shuffle.first(10)
  end

end