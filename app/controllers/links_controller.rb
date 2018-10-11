class LinksController < ApplicationController
  def new
    @link = Link.new
  end

  def show
    @link = Link.find(params[:id])
  end

  def create
    @link = Link.new(create_params)

    respond_to do |format|
      if @link.save
        format.html { redirect_to @link, notice: 'Link was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def redirect
    redirect_to Link.find(params[:id]).destination
  end

  private

  def create_params
    params.require(:link).permit(:destination)
  end
end
