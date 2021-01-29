class ArticlesController < ApplicationController
  before_action :set_article, only: %i[show edit update destroy]
  before_action :authorize, only: %i[create edit update]

  def index
    @articles = Article.all
  end

  def show; end

  def new
    @article = current_user.articles.build
  end

  def edit; end

  def create
    temp_params = article_params
    category_params = temp_params["category_ids"]
    temp_params.delete("category_ids")
    @article = current_user.articles.build(temp_params)
    respond_to do |format|
      if @article.save
        @article.category_ids = category_params
        format.html { redirect_to @article, notice: 'Article was successfully created.' }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @article.update(article_params)
        format.html { redirect_to @article, notice: 'Article was successfully updated.' }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @article.article_categorizations.each(&:destroy)
    @article.destroy
    respond_to do |format|
      format.html { redirect_to articles_url, notice: 'Article was successfully destroyed.' }
    end
  end

  private

  def set_article
    @article = Article.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:title, :text, :image, category_ids: [])
  end
end
