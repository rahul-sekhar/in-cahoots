class Admin::ProjectsController < Admin::ApplicationController
  def index
    @projects = Project.all
  end

  def show
    @project = Project.find(params[:id])
  end

  def new
    @project = Project.new
    render 'show'
  end

  def create
    @project = Project.new(project_params)

    if @project.save
      redirect_to admin_projects_path
    else
      render 'show', status: 422
    end
  end

  def update
    @project = Project.find(params[:id])
    @project.assign_attributes(project_params)

    if @project.save
      redirect_to admin_projects_path
    else
      render 'show', status: 422
    end
  end

  private

  def project_params
    params.require(:project).permit(:title, :description, :content, :url)
  end
end