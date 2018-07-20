class Article < ApplicationRecord
	
	validates :title, presence: true,
			length: {minimum: 3}
	validates :text, presence: true,
			length: {minimum: 3}

	# validates :belong_to_admin

	# current_user = User.new( userid)
	# person.valid? # => false
	# person.errors.messages

	# def belong_to_admin
	#     if current_user.admin? == false
	#       errors.add(:admin, "must be admin")
	#     end
 #  	end


	paginates_per 5

	def self.search(params)
		articles = Article.where("text LIKE ? or title LIKE ?", "%#{params[:search]}%", 
				 "%#{params[:search]}%") if params [:search].present?
					articles #returns the articles containing the search words
	end 
end
