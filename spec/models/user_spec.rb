require 'rails_helper'
require 'faker'

RSpec.describe User, :type => :model do

	describe "#binary_array" do 

		user = User.create(email: Faker::Internet.email, password: "password")

		it "takes a user's string and converts it to a binary array" do 
			user.update(binary_string: "12345674536271")
			expect(user.binary_array).to eq([-3,-2,-1,0,1,2,3,0,1,-1,2,-2,3,-3])
		end 

		it "if any x's in the user's binary_string, maps it value to 0" do 
			user.update(binary_string: "123456x45362x1")
			expect(user.binary_array).to eq([-3,-2,-1,0,1,2,0,0,1,-1,2,-2,0,-3])
		end 

	end 

end
