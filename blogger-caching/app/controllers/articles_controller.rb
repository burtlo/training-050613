class ArticlesController < ApplicationController

  before_filter :require_login, except: [ :index, :show ]

  helper_method :current_blog

  def current_blog
    Blog.find(params[:blog_id])
  end

  def index
    @articles = current_blog.articles.all
    @article_count = current_blog.articles.count
  end

  def show
    @article = Article.find(params[:id])
    @comment = Comment.new
  end

  def new
    @article = Article.new
  end

  def create
    @article = current_blog.articles.create params[:article]

    if @article.valid?
      redirect_to blog_article_path(current_blog,@article)
    else
      render :new
    end
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])

    # An alternative to updating the article
    # Article.update @article, params[:article]

    if @article.update_attributes params[:article]
      flash[:message] = "You're awesome, you updated the article"
      redirect_to blog_articles_path(current_blog,@article)
    else
      render :edit
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    flash[:message] = "You're awesome, You deleted article '#{@article.title}'"
    redirect_to blog_articles_path(current_blog)
  end

end