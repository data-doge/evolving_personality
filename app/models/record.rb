class Record < ActiveRecord::Base

	has_one :personality_type

	def update!(result)
		unless result.nil?
			case result[:type]
				when "E" then self.EI += result[:score]
				when "I" then self.EI -= result[:score]
				when "S" then self.SN += result[:score]
				when "N" then self.SN -= result[:score]
				when "T" then self.TF += result[:score]
				when "F" then self.TF -= result[:score]
				when "J" then self.JP += result[:score]
				when "P" then self.JP -= result[:score]
			end
		end
		self.save
	end

	def calculate_type!
		personality_type = ""
		self.EI > 0 ? personality_type += "E" : personality_type += "I"
		self.SN > 0 ? personality_type += "S" : personality_type += "N"
		self.TF > 0 ? personality_type += "T" : personality_type += "F"
		self.JP > 0 ? personality_type += "J" : personality_type += "P"
		self.personality_type = PersonalityType.find_by(name: personality_type)
		self.save
	end

end