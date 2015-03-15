class Question < ActiveRecord::Base

	def translate(bit,uid)
		if question = Question.find_by(uid: uid)
			case 
				when bit < 0 then { type: question.result_a[0], score: (question.result_a[1].to_i * bit).abs }
				when bit > 0 then { type: question.result_b[0], score: (question.result_b[1].to_i * bit).abs }
				else nil
			end 
		end 
	end

end
