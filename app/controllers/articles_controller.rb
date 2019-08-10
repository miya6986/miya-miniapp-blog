class ArticlesController < ApplicationController

  def index
    @articles = Article.all.order('id DESC')
  end

  def new
    @article = Article.new
  end

  def show
    @article = Article.find(params[:id])
  end

  def create
    if Article.create(article_params)
      redirect_to action: :index
    else
      flash[:alert] = "投稿に失敗しました"
      redirect_to action: :new
    end
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    if Article.update(article_params)
      redirect_to action: :index
    else
      flash[:alert] = "編集に失敗しました"
      redirect_to action: :edit
    end
  end

  def destroy
    @article = Article.find(params[:id])

    if @article.destroy
      redirect_to action: :index
    else
      flash[:alert] = "削除に失敗しました"
      redirect_to action: :index
    end
  end

  private
  def article_params
    params.require(:article).permit(:title, :text).merge(user_id: current_user.id)
  end
  
end
