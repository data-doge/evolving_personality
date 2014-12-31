require 'rails_helper'
require 'faker'

RSpec.describe Examiner, :type => :model do 

	describe "#self.prepare_for(user)" do 

		it "creates a new instance of the examiner model with user as an initializer" do 
			user = User.create(email: Faker::Internet.email, password: "password")
			Examiner.prepare_for(user)
		end 

		it "calls the examine! method on this new instance" do 
		end 

	end 
	
	describe "#initialize(user)" do 

		it "saves inputted user and an instance variable called @user" do 

		end 

	end 

	describe "#examine!" do

		it "creates a new record for user" do 
		end 

	end 

	describe "#translate(byte,uid)" do 

		describe "if valid uid and byte values" do 
			it "returns a hash" do 
			end 
			it "that hash contains a key called type" do 
			end 
			it "if byte is greater than 0, that type is the letter in result_a of the question with specified uid"
			end 
			it "if byte is less than 0, that type is the letter in result_b of the question with specified uid"
			end 
			it "that hash contains a key called score" do 
			end 
			it "if the byte is greater than 0, that score is the number in result_a of the question with specified uid, multiplied by the specified byte" do 
			end 
			it "if the byte is less than 0, that score is the number in result_b of the question with specified uid, multiplied by the specified byte" do 
			end 
		end 

		describe "if invalid uri or byte values" do 

			it "if invalid byte returns nil" do 
			end 
			it "if invalid uri returns nil" do 
			end 
		end 

	end 

	describe "#update_record!(result)" do 
		it "if result is E, adds score to user's record's EI property" do 
		end 
		it "if result is I, decrements score from user's record's EI property" do 
		end 
		it "if result is S, adds score to user's record's SN property" do 
		end 
		it "if result is N, decrements score from user's record's SN property" do 
		end 
		it "if result is T, adds score to user's record's TF property" do 
		end 
		it "if result is F, decrements score from user's record's TF property" do 
		end 
		it "if result is J, adds score to user's record's JP property" do 
		end 
		it "if result is P, decrements score from user's record's JP property" do 
		end 
	end 

end 