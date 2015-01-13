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
			update_record!(result, record)
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

	def update_record!(result, record)
		unless result.nil?
			case result[:type]
				when "E" then record.EI += result[:score] 
				when "I" then record.EI -= result[:score]  
				when "S" then record.SN += result[:score]
				when "N" then record.SN -= result[:score]
				when "T" then record.TF += result[:score]
				when "F" then record.TF -= result[:score]
				when "J" then record.JP += result[:score]
				when "P" then record.JP -= result[:score]
			end 
		end 
	end 

end

