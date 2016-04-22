class StaticPagesController < ApplicationController
  def home
    # if user_signed_in?
    #   redirect_to groups_index_path
    # end
    @allemails = User.all.map(&:email)
  end

  def help
  end

  def about
  end
end
