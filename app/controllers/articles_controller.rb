class ArticlesController < ApplicationController
	# http_basic_authenticate_with name: "AlexDE", password: "AlexDE",
	# except: [:index, :show, :search]

before_action :admin_authorize, :except => [:index, :show, :search]

	def create
		# render plain: params[:article].inspect
		@article = Article.new(article_params)
		@article.user_id = session[:user_id]
		@article.save
		redirect_to @article
	end

	def destroy
		@article = Article.find(params[:id])
		@article.destroy

		redirect_to articles_path
	end

	def edit
		@article = Article.find(params[:id])
		# @article.save
		# redirect_to @articles
	end

	def index
		@articles = Article.page(params[:page]).per(5)
		# @user = User.find(params[:id])
	end
	

	def new
	end

	def search
		if params[:search].blank?
			@articles = Article.all
		else
			@articles = Article.search(params)
		end
	end

	def show
		# render plain: params[:article].inspect
		@article = Article.find(params[:id])

	end

	def update 
		@article = Article.find(params[:id])
		if @article.update(article_params)
			redirect_to @article
		else
			render 'edit'
		end
	end

	private
		def article_params
			params.require(:article).permit(:title,:text)
		end

end
