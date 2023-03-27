class AlumnisController < ApplicationController
  before_action :get_index, only: [:edit, :update, :destroy]

  def index
    @alumnis = Alumni.all
  end

  def new
    @alumni = Alumni.new
  end

  def create
    @alumni = Alumni.new(alumni_params)
    @alumni.user = current_user
    @alumni.save

    redirect_to alumnis_path
  end

  def edit
  end

  def update
    @alumni.update(alumni_params)

    redirect_to alumnis_path
  end

  def destroy
    @alumni.destroy

    redirect_to alumnis_path
  end

private

def get_index
  @alumni = Alumni.find(params[:id])
end

def alumni_params
  params.require(:alumni).permit(:name, :graduation_year, :description, :email)
end

end
