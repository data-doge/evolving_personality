class Record < ActiveRecord::Base

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
	end 
	
end
