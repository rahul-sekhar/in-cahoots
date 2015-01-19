class ProjectsController < ApplicationController
  def index
    @projects = Project.weighted
  end

  def show
    @project = Project.find(params[:id])
  end
end