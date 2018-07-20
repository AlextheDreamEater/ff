require 'rails_helper'


RSpec.describe Article, type: :model do
  context "validation tests" do 

  	it "ensures article presence " do 
			article = Article.new(title: nil).save
			expect(article).to eq(false)
		end

	it "ensures body presence " do 
			article = Article.new(text: nil).save
			expect(article).to eq(false)
		end

		# it "ensures presence of admin" do 
		# no_admin = Article.new(:admin => false)
		# expect(article).to eq(false)

		# end
	end
end




