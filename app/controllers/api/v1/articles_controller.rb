module Api
	module V1
		class ArticlesController < ApplicationController
			config.middleware.insert_before 0, Rack::Cors do
		      	allow do
			        origins '*'
			        resource '*', :headers => :any, :methods => [:get, :post, :options]
			        def index
						articles = Article.order('created_at DESC');
						render json: {status: "SUCSESS", message: "Loaded articles", data:articles},status: :ok
					end

					def show
						article =Article.find(params[:id])
						render json: {status: "SUCSESS", message: "Loaded articles", data:article},status: :ok
					end

					def create
						article = Article.new(article_params)
						if article.save
							render json: {status: "SUCSESS", message: "Saved Article", data:article},status: :ok
						else
							render json: {status: "ERROR", message: "Not Saved", data:article.error},status: :unprocessable_entity
						end
					end

					def destroy
						article =Article.find(params[:id])
						article.destroy
						render json: {status: "DELETED", message: "Deleted articles", data:article},status: :ok
					end

					def update
						article =Article.find(params[:id])
						if article.update_attributes(article_params)
							render json: {status: "SUCSESS", message: "Updated  Article", data:article},status: :ok
						else
							render json: {status: "ERROR", message: "Not Updated", data:article.error},status: :unprocessable_entity	
						end
					end

					private

					def article_params
						params.permit(:title, :body)
					end
      			end
    		end
		end
	end
end 