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


RSpec.describe Article, type: :model do
  context "assosiations tests" do 
	it "should be associated with a user" do
	t = User.create(:userid => "John", :email => "john@john.com")
    no_user_article = Article.create(:title => "John is cool", :text => "Be like John" )
    no_user_article.should_not be_valid
  end
	end

end


