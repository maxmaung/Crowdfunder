class ProjectsController < ApplicationController


  def index
    @projects = Project.all
  end

  def show
    @project = Project.find(params[:id])
  end

  def new
    @project = Project.new
  end

  def edit
    @project = Project.find(params[:id])
  end

  def create
    @project = Project.new(project_params)
    @project.owner = current_user
    # byebug
    if @project.save
      redirect_to projects_url [@user, @project]
    else
      render :new
    end
  end

  # def update
  #   @project = Project.find(params[:id])
  #
  #   if @project.update_attributes(project_params)
  #         redirect_to project_url(@project)
  #   else
  #         render :edit
  #   end
  #
  # end

  # def destroy
  #   @project = Project.find(params[:id])
  #   @project.destroy
  #   redirect_to projects_url
  # end

  private
  def project_params
    params.require(:project).permit(:name, :description, :goal, :start_date, :end_date)
  end


end
