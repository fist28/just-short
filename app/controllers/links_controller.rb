class LinksController < ApplicationController
  def new
  end

  def show
  end

  def create
    @link = Link.new

    respond_to do |format|
      if @link.save
        format.html { redirect_to @link, notice: 'Link was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end
end
