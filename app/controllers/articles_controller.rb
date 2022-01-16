class ArticlesController < ApplicationController
    def show
        @article = Article.find(params[:id])
    end

    def index
        @articles = Article.all
    end

    def new
        @articles = Article.new
    end

    def edit
        @articles = Article.find(params[:id])
    end

    def create
        @articles = Article.new(params.require(:article).permit(:title, :description))
        if @articles.save
            flash[:notice] = "Article created Successfully!!"
            redirect_to @articles
        else
            # new way to write render
            render :new, status: :unprocessable_entity
        end
    end

    def update
        @articles = Article.find(params[:id])
        if @articles.update(params.require(:article).permit(:title, :description))
            flash[:notice] = "Article updated Successfully!!"
            redirect_to @articles
        else
            render :edit, status: :unprocessable_entity
        end
    end

    def destroy
        @articles = Article.find(params[:id])
        @articles.destroy
        redirect_to articles_path
    end
end