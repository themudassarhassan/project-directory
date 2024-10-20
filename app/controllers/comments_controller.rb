class CommentsController < ApplicationController
  before_action :set_project

  def create
    @comment = @project.comments.new(comment_params.merge(user: current_user))

    if @comment.save
      respond_to do |format|
        format.turbo_stream
        format.html { redirect_to @project }
      end
    else
      head :no_content
    end
  end

  def destroy
    if @comment.user == current_user
      @comment.destroy
      respond_to do |format|
        format.turbo_stream
        format.html { redirect_to @project }
      end
    else
      head :forbidden
    end
  end


  private
    def set_project
      @project = Project.find(params[:project_id])
    end

    def comment_params
      params.require(:comment).permit(:body)
    end
end
