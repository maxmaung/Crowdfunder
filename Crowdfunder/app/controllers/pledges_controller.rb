class PledgesController < ApplicationController
  before_action do
    @project = Project.find(params[:project_id])
  end

  def new
    @pledge = Pledge.new
  end

  def create
    @pledge = Pledge.new(pledge_params)
    @pledge.user = current_user
    @pledge.project = @project

    if @pledge.save
      redirect_to project_path(@project), :notice => 'Reservation created with success'
    else
      render :new
    end
  end

  def pledge_total
    @pledges = @project.pledges.all
  end

  private

  def pledge_params
    params.require(:pledge).permit(:amount)
  end

end
