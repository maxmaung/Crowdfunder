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
      redirect_to [@project, @pledge], :notice => 'Reservation created with success'
      single_pledge = @pledge.amount
      single_pledge += pledge_total
    else
      render :new
    end
  end

  private

  def pledge_params
    params.require(:pledge).permit(:amount)
  end

end
