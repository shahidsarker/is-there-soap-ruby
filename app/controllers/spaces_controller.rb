# frozen_string_literal: true

class SpacesController < ApplicationController
  # before_action :set_space, only: [:show]

  def index
    @spaces = Space.all
  end

  def show; end

  def new
    @space = Space.new
  end

  def edit; end

  def create
    @space = Space.new(space_params)

    respond_to do |f|
      if @space.save
        f.html { redirect_to @space, notice: 'Space created!' }
        f.json { render :show, status: :created, location: @space }
      else
        f.html { render :new }
        f.json { render json: @space.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |f|
      if @space.update(space_params)
        f.html { redirect_to @space, notice: 'Space updated!' }
        f.json { render :show, status: :ok, location: @space }
      else
        f.html { render :edit }
        f.json { render json: @space.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @space.destroy
    respond_to do |f|
      f.html { redirect_to spaces_url, notice: 'Space destroyed.' }
      f.json { head :no_content }
    end
  end

  private

  def set_space
    @space = Space.find(params[:id])
  end

  def space_params
    # add the fields in here!
    params.require(:space).permit(:name, :description, :location)
  end
end
