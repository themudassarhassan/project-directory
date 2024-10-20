class Projects::StatusChangesController < ApplicationController
  before_action :set_project

  def create
    @status_change = @project.status_changes.create!(status_change_params)

    respond_to do |format|
      format.turbo_stream
      format.html { redirect_to @project }
    end
  end

  private

    def set_project
      @project = Project.find(params[:project_id])
    end

    def status_change_params
      params.permit(:status).merge(user: current_user)
    end
end
