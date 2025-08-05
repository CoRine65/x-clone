class LikesController < ApplicationController
  before_action :authenticate_user!
  before_action :find_likeable
  def create
    @like = @likeable.likes.new(user: current_user)

    if @like.save
      redirect_to request.referer || root_path, notice: "Liked!"
    else
      redirect_to request.referer || root_path, alert: "Unable to like."
    end
  end

  def destroy
    @like = @likeable.likes.find_by(user: current_user)
    if @like
      @like.destroy
      redirect_to request.referer || root_path, notice: "Unliked!"
    else
      redirect_to request.referer || root_path, alert: "Not found or not authorized."
    end
  end

  private

  def find_likeable
    if params[:comment_id]
      @likeable = Comment.find(params[:comment_id])
    elsif params[:post_id]
      @likeable = Post.find(params[:post_id])
    else
      redirect_to root_path, alert: "Invalid like target."
    end
  end
end
