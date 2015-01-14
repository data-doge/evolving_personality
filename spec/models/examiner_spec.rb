require 'rails_helper'
require 'faker'

RSpec.describe Examiner, :type => :model do 

	# describe "#self.prepare_for(user)" do 

	# 	it "creates a new instance of the examiner model with user as an initializer" do 
	# 	end 

	# 	it "calls the examine! method on this new instance" do 
	# 	end 

	# end 
	
	describe "#initialize(user)" do 

		it "saves inputted user and an instance variable called @user" do 
			user = User.create(email: Faker::Internet.email, password: "password")
			examiner = Examiner.new(user)
			expect(examiner.user).to eq(user)
		end 

	end 

	describe "#examine!" do

		before(:all) do 
			@user = User.create(email: Faker::Internet.email, password: "password", binary_string: "123456745362711234567453627112345674536271111111");
			@examiner = Examiner.new(@user)
			load Rails.root + "db/seeds.rb" 
			@examiner.examine!
			@record = @user.records.first
		end

		it "creates a new record for user" do 
			expect(@user.records.length).to eq(1)
		end 

		describe "for user with binary_string: 123456745362711234567453627112345674536271111111" do 

			it "new record has EI of: 5" do 
				expect(@record.EI).to eq(5)
			end 

			it "new record has SN of: 14" do 				
				expect(@record.SN).to eq(14)
			end 

			it "new record has TF of: 15" do 				
				expect(@record.TF).to eq(15)
			end 

			it "new record has JP of: -3" do 				
				expect(@record.JP).to eq(-3)
			end 

		end

	end 

	describe "#translate(bit,uid)" do 

		before(:all) do 
			load Rails.root + "db/seeds.rb"
			@user = User.create(email: Faker::Internet.email, password: "password", binary_string: "123456745362711234567453627112345674536271111111");
			@question = Question.create(uid: 0, prompt: "When you go somewhere for the day, you would rather...", choice_a: "Plan what you will do and when", choice_b: "Just go", result_a: "J2", result_b: "P2")
			@examiner = Examiner.new(@user)
		end

		describe "if valid uid and non-zero bit values" do 

			it "returns a hash" do 
				expect(@examiner.translate(1,0)).to be_a(Hash) 
			end 

			it "that hash contains a key called type" do 
				expect(@examiner.translate(1,0)).to have_key(:type)
			end 

			it "if bit is greater than 0, that type is the letter in result_b of the question with specified uid" do 
				expect(@examiner.translate(1,0)[:type]).to eq("P")
			end 

			it "if bit is less than 0, that type is the letter in result_a of the question with specified uid" do 
				expect(@examiner.translate(-1,0)[:type]).to eq("J")
			end 

			it "that hash contains a key called score" do 
				expect(@examiner.translate(1,0)).to have_key(:type)
			end 

			it "if the bit is greater than 0, that score is the number in result_b of the question with specified uid, multiplied by the specified bit" do 
				expect(@examiner.translate(2,0)[:score]).to eq(4)
			end 

			it "if the bit is less than 0, that score is the number in result_a of the question with specified uid, multiplied by the specified bit" do 
				expect(@examiner.translate(3,0)[:score]).to eq(6)
			end 

		end 

		describe "if invalid uid or zero bit values" do 

			it "zero bit returns nil" do
				expect(@examiner.translate(0,0)).to be_nil
			end 
			it "if invalid uid returns nil" do 
				expect(@examiner.translate(0,1)).to be_nil
			end 

		end 

	end 

	describe "#update_record!(result)" do 
	
		before do 
			@user = User.create(email: "eugenestapler@gmail.com", password: "password", binary_string: "123456745362711234567453627112345674536271111111");
			@examiner = Examiner.new(@user)
			@record = @user.records.create
		end

		it "if result type is E, adds score to user's record's EI property" do
			result = { type: "E", score: 3}
			@examiner.update_record!(result,@record)
			expect(@record.EI).to eq(3);
		end 

		it "if result type is I, decrements score from user's record's EI property" do 
			result = { type: "I", score: 3}
			@examiner.update_record!(result,@record)
			expect(@record.EI).to eq(-3);
		end 

		it "if result type is S, adds score to user's record's SN property" do 
			result = { type: "S", score: 2}
			@examiner.update_record!(result,@record)
			expect(@record.SN).to eq(2);
		end 

		it "if result type is N, decrements score from user's record's SN property" do 
			result = { type: "N", score: 2}
			@examiner.update_record!(result,@record)
			expect(@record.SN).to eq(-2);
		end 

		it "if result type is T, adds score to user's record's TF property" do 
			result = { type: "T", score: 1}
			@examiner.update_record!(result,@record)
			expect(@record.TF).to eq(1);
		end 

		it "if result type is F, decrements score from user's record's TF property" do 
			result = { type: "F", score: 1}
			@examiner.update_record!(result,@record)
			expect(@record.TF).to eq(-1);
		end 

		it "if result type is J, adds score to user's record's JP property" do 
			result = { type: "J", score: 3}
			@examiner.update_record!(result,@record)
			expect(@record.JP).to eq(3);
		end 

		it "if result type is P, decrements score from user's record's JP property" do 
			result = { type: "P", score: 3}
			@examiner.update_record!(result,@record)
			expect(@record.JP).to eq(-3);
		end 

	end 

end 