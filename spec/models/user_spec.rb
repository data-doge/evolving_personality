require 'rails_helper'
require 'faker'

RSpec.describe User, :type => :model do

	describe "#binary_array" do 

		before { @user = User.create(email: Faker::Internet.email, password: "password") }

		it "takes a user's string and converts it to a binary array" do 
			@user.update(binary_string: "12345674536271")
			expect(@user.binary_array).to eq([-3,-2,-1,0,1,2,3,0,1,-1,2,-2,3,-3])
		end 

		it "if any x's in the user's binary_string, maps it value to 0" do 
			@user.update(binary_string: "123456x45362x1")
			expect(@user.binary_array).to eq([-3,-2,-1,0,1,2,0,0,1,-1,2,-2,0,-3])
		end 

	end 

	describe "#questionnaire_complete?" do 

		it "returns true if there are no x's in the user's binary string" do 
			user = User.create(email: Faker::Internet.email, password: "password", binary_string: "154617161231237123516472626154617161231237123516")
			expect(user.questionnaire_complete?).to be true 
		end 

		it "returns false if there are x's in the user's binary string" do 
			user = User.create(email: Faker::Internet.email, password: "password", binary_string: "1546171612312371235164726261xx617161231237123516")
			expect(user.questionnaire_complete?).to be false
		end

	end 

	describe "update_binary_string_with" do 

		it "updates the user's binary string with the scores of the new answers" do 
			user = User.create(email: Faker::Internet.email, password: "password")
			answers = {"0"=>"4", "1"=>"7", "2"=>"1", "3"=>"5", "4"=>"3", "5"=>"2", "6"=>"6", "7"=>"2", "8"=>"5", "9"=>"4", "10"=>"5", "11"=>"6", "12"=>"7", "13"=>"1", "14"=>"7", "15"=>"2", "16"=>"7", "17"=>"3", "18"=>"5", "19"=>"3", "20"=>"5", "21"=>"7", "22"=>"1", "23"=>"7", "24"=>"7", "25"=>"7", "26"=>"7", "27"=>"6", "28"=>"6", "29"=>"3", "30"=>"2", "31"=>"3", "32"=>"5", "33"=>"3", "34"=>"4", "35"=>"5", "36"=>"5", "37"=>"3", "38"=>"2", "39"=>"5", "40"=>"3", "41"=>"2", "42"=>"6", "43"=>"2", "44"=>"3", "45"=>"5", "46"=>"5", "47"=>"5"}
			binary_string = "471532625456717273535717777663235345532532623555"
			user.update_binary_string_with(answers)
			expect(user.binary_string).to eq(binary_string)
		end 
	end 

end
