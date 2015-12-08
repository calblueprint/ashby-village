class RepliesController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @group = @post.group
    @reply = @post.replies.build(reply_params)
    @reply.save
    @new_reply = Reply.new
  # TODO (Shimmy): Flash success notification on send
  end

  def destroy
  end

  private

    # TODO (Shimmy): Add picture support
  def reply_params
    params.require(:reply).permit(:content, :post_id, :user_id).merge(user_id: current_user.id)
  end

  # TODO (Shimmy): Use CanCanCan instead.
  def correct_user
    @reply = current_user.reply.find_by(id: params[:id])
    redirect_to root_url if @reply.nil?
  end
end
