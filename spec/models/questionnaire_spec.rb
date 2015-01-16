require 'rails_helper'

RSpec.describe Question, :type => :model do

	describe "#self.create_for(user)" do 

		before(:all) do 
			load Rails.root + "db/seeds.rb"
			@user = User.create(email: Faker::Internet.email, password: "password", binary_string: "1234567x53xx711234x67453627x12345674x36271111111");
			@questions = Questionnaire.create_for(@user)
		end 

		it "returns an array" do 
			expect(@questions).to be_an(Array)
		end 

		it "the array's length is equal to the number of x's in the user's binary string" do 
			expect(@questions.length).to eq(6)
		end 

		it "the array contains questions with uid matching the x's index in the binary string" do 
			uids = @questions.map { |question| question.uid }
			indices = [7,10,11,18,27,36]
			expect(uids).to match_array(indices)
		end 

	end 

	# describe "#self.update_for(user)" do 

	# 	it "returns an array" do 
	# 	end 

	# 	it "that array contains 5 questions" do 
	# 	end 

	# 	it "questions are unique" do 
	# 	end 

	# end

end
