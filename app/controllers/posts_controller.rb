class PostsController < ApplicationController
  # TODO(Shimmy): Define logged_in_user
  # before_action :logged_in_user, only: [:create, :destroy]
  before_action :correct_user,   only: :destroy

  # TODO(Shimmy): Watch out for duplicates
  # Doing the posts using old fashioned forms
  def new
    @post = Post.new
    @group = Group.friendly.find(params[:group_id])
  end

  def create
    @reply = Reply.new
    @group = Group.friendly.find(params[:group_id])
    @post = @group.posts.build(post_params)

    if @post.save
      flash[:notice] = "Post successful"
      redirect_to @group
    end
    # TODO(Shimmy): Flash success notification on send
  end

  def destroy
    @post.destroy
    flash[:notice] = "Post deleted"
    redirect_to :back
  end

  private

  # TODO(Shimmy): Add picture support
  def post_params
    params.require(:post).permit(:title, :content, :user_id, :group_id).merge(user_id: current_user.id)
  end

  # TODO(Shimmy): Use CanCanCan instead.
  def correct_user
    @post = current_user.posts.find_by(id: params[:id]) || Post.find_by(id: params[:id])
    redirect_to root_url if @post.nil?
  end
end
