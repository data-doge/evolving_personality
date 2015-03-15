require 'rails_helper'

RSpec.describe Record, :type => :model do

	describe "#update!(result)" do 
	
		before do 
			@user = User.create(email: "eugenestapler@gmail.com", password: "password", binary_string: "123456745362711234567453627112345674536271111111");
			@record = @user.records.create
		end

		it "if result type is E, adds score to user's record's EI property" do
			result = { type: "E", score: 3}
			@record.update!(result)
			expect(@record.EI).to eq(3);
		end 

		it "if result type is I, decrements score from user's record's EI property" do 
			result = { type: "I", score: 3}
			@record.update!(result)
			expect(@record.EI).to eq(-3);
		end 

		it "if result type is S, adds score to user's record's SN property" do 
			result = { type: "S", score: 2}
			@record.update!(result)
			expect(@record.SN).to eq(2);
		end 

		it "if result type is N, decrements score from user's record's SN property" do 
			result = { type: "N", score: 2}
			@record.update!(result)
			expect(@record.SN).to eq(-2);
		end 

		it "if result type is T, adds score to user's record's TF property" do 
			result = { type: "T", score: 1}
			@record.update!(result)
			expect(@record.TF).to eq(1);
		end 

		it "if result type is F, decrements score from user's record's TF property" do 
			result = { type: "F", score: 1}
			@record.update!(result)
			expect(@record.TF).to eq(-1);
		end 

		it "if result type is J, adds score to user's record's JP property" do 
			result = { type: "J", score: 3}
			@record.update!(result)
			expect(@record.JP).to eq(3);
		end 

		it "if result type is P, decrements score from user's record's JP property" do 
			result = { type: "P", score: 3}
			@record.update!(result)
			expect(@record.JP).to eq(-3);
		end 

	end 

end
