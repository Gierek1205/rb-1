class ArticlesController < ApplicationController

  http_basic_authenticate_with name: "franek", password: "1234",
except: [:index, :show]

  def index
    @articles = Article.all
  end

  def new
    @article = Article.new
  end

  def edit
      @article = Article.find(params[:id])
  end

  def show
    @article = Article.find(params[:id])
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy

    redirect_to articles_path
  end

  def create
    @article = Article.new(params.require(:article).permit(:title, :text))

    if @article.save
      redirect_to @article
    else
      render 'new'
    end
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
    params.require(:article).permit(:title, :text, :image_src)
  end




end
