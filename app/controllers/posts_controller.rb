class PostsController < ApplicationController
  # TODO (Shimmy): Define logged_in_user
  # before_action :logged_in_user, only: [:create, :destroy]

  def create
    @group = Group.friendly.find(params[:group_id])
    @post = @group.posts.build(post_params)
    @post.user_id = current_user.id
    if @post.save
      flash[:success] = "Post created!"
      redirect_to '/'
    else
      flash[:error] = "Nope"
    end
  end

  def destroy
  end


  private

    # TODO (Shimmy): Add picture support
    def post_params
      params.require(:post).permit(:content, :user_id, :group_id)
    end

    def correct_user
      @post = current_user.post.find_by(id: params[:id])
      redirect_to root_url if @post.nil?
    end
end
