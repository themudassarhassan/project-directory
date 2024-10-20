class ProjectsController < ApplicationController
  before_action :set_project, only: [ :show, :edit, :update, :destroy ]
  before_action :authorize_user, only: [ :edit, :update, :destroy ]

  def index
    @projects = Project.order(created_at: :desc)
  end

  def new
    @project = Project.new
  end

  def create
    @project = current_user.projects.build(project_params)

    if @project.save
      redirect_to projects_url, notice: "Project created successfully."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @project.update(project_params)
      redirect_to projects_url, notice: "Project updated successfully."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def show
    @comments = @project.comments.order(created_at: :desc)
    @status_changes = @project.status_changes.order(created_at: :desc)
  end

  def destroy
    @project.destroy

    redirect_to projects_url, notice: "Project deleted successfully."
  end

  private
    def project_params
      params.require(:project).permit(:name, :description)
    end

    def set_project
      @project = Project.find(params[:id])
    end

    def authorize_user
      authorize @project
    end
end
