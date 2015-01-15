class Examiner

	attr_reader :user

	def self.prepare_for(user)
		examiner = new(user)
		examiner.examine!
	end 

	def initialize(user)
		@user = user
	end

	def examine!
		record = @user.records.create
		binary_array = @user.binary_array
		binary_array.each_with_index do |bit, uid|
			result = translate(bit,uid)
			record.update!(result)
		end
	end

	def translate(bit,uid)
		if question = Question.find_by(uid: uid)
			case 
				when bit < 0 then { type: question.result_a[0], score: (question.result_a[1].to_i * bit).abs }
				when bit > 0 then { type: question.result_b[0], score: (question.result_b[1].to_i * bit).abs }
				else nil
			end 
		else 
			nil
		end 
	end

end

