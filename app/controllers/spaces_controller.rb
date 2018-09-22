# frozen_string_literal: true

class SpacesController < ApplicationController
  before_action :set_space, only: [:show,:edit, :update, :destroy]

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

    respond_to do |format|
      if @space.save
        format.html { redirect_to @space, notice: 'Space created!' }
        format.json { render :show, status: :created, location: @space }
      else
        format.html { render :new }
        format.json { render json: @space.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @space.update(space_params)
        format.html { redirect_to @space, notice: 'Space updated!' }
        format.json { render :show, status: :ok, location: @space }
      else
        format.html { render :edit }
        format.json { render json: @space.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @space.destroy
    respond_to do |format|
      format.html { redirect_to spaces_url, notice: 'Space destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_space
    @space = Space.find(params[:id])
  end

  def space_params
    # add the fields in here!
    params.require(:space).permit(:name, :description, :location, :image)
  end
end
