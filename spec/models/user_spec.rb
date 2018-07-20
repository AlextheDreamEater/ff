require 'rails_helper'

RSpec.describe User, type: :model do
	context "validation tests" do 
		
		it "ensures userid presence " do 
			user = User.new(userid: nil).save
			expect(user).to eq(false)
		end

		it "ensures all fields present except email" do 
			user = User.new(email: "man@man.com").save
			expect(user).to eq(false)
		end

		it "ensures password presence " do 
			user = User.new(password: nil).save
			expect(user).to eq(false)
		end


		it "should save successfully" do 
			user = User.new(userid: "mmm", email: "man@man.com", password: "manman").save
			expect(user).to eq(true)
		end
	# end
	end
end

