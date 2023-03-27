class ActivitiesController < ApplicationController
  before_action :get_index, only: [:edit, :update, :destroy]

  def index
    @activities = Activity.all
  end

  def new
    @activity = Activity.new
  end

  def create
    @activity = Activity.new(activity_params)
    @activity.user = current_user
    @activity.save

    redirect_to activities_path
  end

  def edit
  end

  def update
    @activity = Activity.update(activity_params)

    redirect_to activities_path
  end

  def destroy
    @activity.destroy

    redirect_to activities_path
  end

  private

  def get_index
    @activity = Activity.find(params[:id])
  end

  def activity_params
    params.require(:activity).permit(:type, :date, :title, :description, :link)
  end

end
