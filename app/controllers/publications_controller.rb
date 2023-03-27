class PublicationsController < ApplicationController
  before_action :get_index, only: [:edit, :update, :destroy]

  def index
    @publications = Publication.all
  end

  def new
    @publication = Publication.new
  end

  def create
    @publication = Publication.new(publication_params)
    @publication.user = current_user
    @publication.save

    redirect_to publications_path
  end

  def edit
  end

  def update
    @publication = Publication.update(publication_params)

    redirect_to publications_path
  end

  def destroy
    @publication.destroy

    redirect_to publications_path
  end

  private

  def get_index
    @publication = Publication.find(params[:id])
  end

  def publication_params
    params.require(:publication).permit(:date, :title, :link)
  end

end
