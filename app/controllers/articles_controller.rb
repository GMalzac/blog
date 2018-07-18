class ArticlesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :set_article, only: [:show, :edit, :update, :destroy]

  def index
    @articles = policy_scope(Article).order(created_at: :desc)
  end

  def show
    authorize @article
  end

  def new
    @article = Article.new
    authorize @article
  end

  def edit
  end

  def create
    @article = Article.new(article_params)
    authorize @article
    if @article.save
      redirect_to @article
    else
      render 'new'
    end
  end

  def update
    if @article.update(article_params)
      authorize @article
      redirect_to @article
    else
      render 'edit'
    end
  end

  def destroy
    @article.destroy
    redirect_to articles_path
  end

  private

  def article_params
    params.require(:article).permit(:title, :subtitle, :text, :user_id, :photo)
  end

  def set_article
    @article = Article.find(params[:id])
    authorize @article
  end
end
