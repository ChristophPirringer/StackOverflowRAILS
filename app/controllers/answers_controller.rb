class AnswersController < ApplicationController
  # before_filter :the_author, only: [:edit, :update, :destroy, :new, :create]

  def new
    @post = Post.find(params[:post_id])
    @answer = @post.answers.new
  end

  def create
    @post = Post.find(params[:post_id])
    @answer = @post.answers.new(answer_params)
    if @answer.save
      flash[:notice] = "Answer successfully added!"
      redirect_to post_path(@answer.post)
    else
      render :new
    end
  end

  def edit
    @answer = Answer.find(params[:id])
  end

  def update
    @post = Post.find(params[:post_id])
    @answer= Answer.find(params[:id])
    if params[:best] == "true"
      binding.pry
      @answer.best = true
      @answer.save
      redirect_to post_path(@post)
    else
      if @answer.update(answer_params)
        redirect_to post_path(@post)
      else
        redirect_to post_path(@post)
        flash[:notice] = "Something wrent wrong here!"
      end
    end
  end

  def destroy
    @post = Post.find(params[:post_id])
    @answer = Answer.find(params[:id])
    @answer.destroy
    flash[:alert] = "Answer successfully deleted!"
    redirect_to post_path(@post)
  end

  private
  def answer_params
    params.require(:answer).permit(:author, :content)
  end

end
