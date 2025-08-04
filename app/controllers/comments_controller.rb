class CommentsController < ApplicationController
  before_action :authenticate_user!
  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.build(comment_params)
    @comment.user = current_user

    if @comment.save
     redirect_to request.referer || post_path(@post), notice: "Success, comment added."
    else
      redirect_to request.referer || post_path(@post), alert: "Comment could not be added."
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    if @comment.user == current_user
      @comment.destroy
      redirect_to request.referer || post_path(params[:post_id]), notice: "Comment deleted."
    else
      redirect_to request.referer || post_path(params[:post_id]), alert: "Not authorized"
    end
  end

  def update
    @comment = Comment.find(params[:id])

    if @comment.user == current_user
      if @comment.update(comment_params)
        redirect_to post_path(@comment.post), notice: "Comment updated successfully."
      else
        redirect_to request.referer || post_path(@comment.post), alert: "Failed to udpate comment."
      end
    else
      redirect_to request.referer || post_path(@comment.post), alert: "You are not authorized to update this comment."
    end
  end

  def edit
    @comment = Comment.find(params[:id])
    if @comment.user != current_user
      redirect_to request.referer || post_path(params[:post_id]), alert: "Not authorized."
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end
end
