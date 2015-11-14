class PostsController < ApplicationController
  # TODO (Shimmy): Define logged_in_user
  # before_action :logged_in_user, only: [:create, :destroy]

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      flash[:success] = "Post created!"
      redirect_to 'static_pages/home'
    else
      flash[:error] = "Nope"
    end
  end

  def destroy
  end


  private

    # TODO (Shimmy): Add picture support
    def post_params
      params.require(:post).permit(:content, :)
    end

    def correct_user
      @post = current_user.post.find_by(id: params[:id])
      redirect_to root_url if @post.nil?
    end
end
