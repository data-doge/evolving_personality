# class Questionnaire 

# 	def self.get_scores_from(binary_string)
# 		binary_array = binary_string.split('').map { |byte| byte.to_i }
# 		scores = binary_array.map do |byte|
# 			question_uid = scores.index(byte)
# 			case 
# 				when byte > 4 then result = Question.find(uid: question_uid).result_b
# 				when byte < 4 then result = Question.find(uid: question_uid).result_a
# 				else result = nil
# 			end
# 			type = result[0]
# 			score = (result[1]*(byte-4)).abs
# 		end
# 	end

# end"
