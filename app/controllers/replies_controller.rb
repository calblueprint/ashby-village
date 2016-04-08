class RepliesController < ApplicationController
  def create
    post = Post.find(params[:post_id])
    @group = post.group
    @reply = post.replies.build(reply_params)
    if @reply.save
      flash[:notice] = "Reply successful"
      redirect_to group_path(@group, {}, anchor: "post_id#{@reply.id}")
    end
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
