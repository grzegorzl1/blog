class CommentsController < ApplicationController
http_basic_authenticate_with name: "admin", password: "secret", only: [:destroy]
  def create
    @article = Article.find(params[:article_id])
    @comment = Comment.new(article_id: @article.id)
    @comment.attributes = comment_params

    if @comment.save
      redirect_to article_path(@article)
    else
      render "articles/show"
    end
  end

  def destroy
    comment = Comment.find(params[:id])
    comment.destroy

    redirect_to article_path(comment.article)
  end

  private

  def comment_params
    params.require(:comment).permit(:commenter, :body)
  end
end
