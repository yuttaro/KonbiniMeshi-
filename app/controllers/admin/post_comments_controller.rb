class Admin::PostCommentsController < ApplicationController

  def index
    @post_comments = PostComment.all
  end

  def show

  end

  def destroy
    PostComment.find(params[:id]).destroy
    redirect_to request.referer
  end

  private

  def post_comment_params
    params.require(:post_comment).permit(:comment)
  end

end
