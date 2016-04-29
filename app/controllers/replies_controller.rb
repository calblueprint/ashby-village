class RepliesController < ApplicationController
  def create
    post = Post.find(params[:post_id])
    @group = post.group
    @event = post.event
    @reply = post.replies.build(reply_params)
    if @reply.save
      flash[:notice] = "Reply successful"
      if @group.nil?
        redirect_to group_event_path(@event.group, @event)
      else
        redirect_to group_path(@group, {}, anchor: "post_id#{@reply.id}")
      end
    end
  end

  def destroy
    Reply.find(params[:post_id]).destroy
    redirect_to :back
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
