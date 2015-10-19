class AnswersController < ApplicationController
  def new
    @post = Post.find(params[:post_id])
    @answer = @post.answers.new
  end

  def create
    @post = Post.find(params[:post_id])
    @answer = @post.answers.new(answer_params)
    if @answer.save
      redirect_to post_path(@answer.post)
    else
      render :new
    end
  end

  private
  def answer_params
    params.require(:answer).permit(:author, :content)
  end

end
