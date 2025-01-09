class CommentsController < ApplicationController
  before_action :set_project, only: [:create]
  before_action :set_comment, only: [:edit, :update, :destroy]

  def create
    @comment = @project.comments.new(comment_params.merge(user: current_user))

    if @comment.save
      respond_to do |format|
        format.turbo_stream
      end
    else
      head :no_content
    end
  end
  
  def edit
  end

  def update
    if @comment.update(comment_params)
      render partial: 'comment', locals: { comment: @comment }
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if @comment.user == current_user
      @comment.destroy
      respond_to do |format|
        format.turbo_stream
      end
    else
      head :forbidden
    end
  end


  private
    def set_comment
      @comment = Comment.find(params[:id])
    end

    def set_project
      @project = Project.find(params[:project_id])
    end

    def comment_params
      params.require(:comment).permit(:body)
    end
end
