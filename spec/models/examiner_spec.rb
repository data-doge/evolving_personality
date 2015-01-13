		#  0  1  2  3  4  5  6  7  8  9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31 32 33 34 35 36 37 38 39 40 41 42 43 45 46 47 48 
		# -3 -2 -1  0  1  2  3  0  1 -1  2 -2  3 -3 -3 -2 -1  0  1  2  3  0  1 -1  2 -2  3 -3 -3 -2 -1  0  1  2  3  0  1 -1  2 -2  3 -3 -3 -3 -3 -3 -3 -3 
		# J2 S2 E2  X S1 I1 I0  X I1 S1 P1 S1 I2 F1 N0 E2 J2  X P1 N2 I2  X S2 E1 P2 S2 E2 T2 N0 T1 F0  X N1 E2 F2  X F1 F1 P2 S1 E1 T1 N0 T2 F1 S1 T2 T2   
		# J6 S4 E2    S1 I2       I1 S1 P2 S2 I6 F3    E4 J2    P1 N4 I6    S2 E1 P4 S4 E6 T6    T2       N1 E4 F6    F1 F1 P4 S2 E3 T3    T6 F3 S3 T6 T6
		# EI: E2 I2 I1 I6 E4 I6 E1 E6 E4 E3    = 2-2-1-6+4-6+1+6+4+3    = 5
		# SN: S4 S1 S1 S2 N4 S2 S4 N1 S2 S3    = 4+1+1+2-4+2+4-1+2+3    = 14
		# TF: F3 T6 T2 F6 F1 F1 T3 T6 F3 T6 T6 = -3+6+2-6-1-1+3+6-3+6+6 = 15
		# JP: J6 P2 J2 P1 P4 P4                = 6-2+2-1-4-4            = -3
require 'rails_helper'
require 'faker'

RSpec.describe Examiner, :type => :model do 

	load Rails.root + "db/seeds.rb" 

	describe "#self.prepare_for(user)" do 

		it "creates a new instance of the examiner model with user as an initializer" do 
			# user = User.create(email: Faker::Internet.email, password: "password")
			# Examiner.prepare_for(user)
			# expect(User.all.length).to eq(1)
		end 

		it "calls the examine! method on this new instance" do 
		end 

	end 
	
	describe "#initialize(user)" do 

		it "saves inputted user and an instance variable called @user" do 

		end 

	end 

	describe "#examine!" do

		before do 
			@user = User.create(email: "eugenestapler@gmail.com", password: "password", binary_string: "123456745362711234567453627112345674536271111111");
			@examiner = Examiner.new(@user)
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

		before do 
			@user = User.create(email: "eugenestapler@gmail.com", password: "password", binary_string: "123456745362711234567453627112345674536271111111");
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