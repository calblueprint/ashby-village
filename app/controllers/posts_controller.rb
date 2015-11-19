class PostsController < ApplicationController
  # TODO (Shimmy): Define logged_in_user
  # before_action :logged_in_user, only: [:create, :destroy]

  def index
    @group = Group.friendly.find(params[:group_id])
    @posts = @group.posts
  end

  def new
    @post = Post.new
  end

  # TODO (Shimmy): Watch out for duplicates
  # TODO (Shimmy): Flash success notification on send
  # TODO (Shimmy): Make layout: false
  def create
    byebug
    @group = Group.friendly.find(params[:group_id])
    @post = @group.posts.build(post_params)
    @post.user_id = current_user.id
    @post.save
  end

  def destroy
  end

  private

    # TODO (Shimmy): Add picture support
  def post_params
    params.require(:post).permit(:title, :content, :user_id, :group_id)
  end
  # TODO (Shimmy): Use CanCanCan instead.

  def correct_user
    @post = current_user.post.find_by(id: params[:id])
    redirect_to root_url if @post.nil?
  end
end
