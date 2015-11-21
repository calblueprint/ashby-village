class PostsController < ApplicationController
  # TODO (Shimmy): Define logged_in_user
  # before_action :logged_in_user, only: [:create, :destroy]

  # TODO (Shimmy): Watch out for duplicates
  def create
    @group = Group.friendly.find(params[:group_id])
    @post = @group.posts.build(post_params)
    @post.save
  # TODO (Shimmy): Flash success notification on send
  end

  def destroy
  end

  private

    # TODO (Shimmy): Add picture support
  def post_params
    params.require(:post).permit(:title, :content, :user_id, :group_id).merge(user_id: current_user.id)
  end

  # TODO (Shimmy): Use CanCanCan instead.
  def correct_user
    @post = current_user.post.find_by(id: params[:id])
    redirect_to root_url if @post.nil?
  end
end