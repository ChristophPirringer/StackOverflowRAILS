class UpvotesController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @upvote = Upvote.new(post: @post, user:  current_user)
    @upvote.post = Post.find(params[:post_id])
    if @upvote.save
      redirect_to posts_path, notice: "Thanks for votin!"
    else
      redirect_to posts_path, notice: "You Fail!"
    end
  end

  def destroy
  end

  private
    # def upvote_params
    #   params.require(:upvote).permit(:user)
    # end
end
