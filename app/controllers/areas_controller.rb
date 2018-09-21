class AreasController < ApplicationController
  before_action :set_areas, only: [:show, :edit, :update, :destroy]

  def index
    @areas = Area.all
  end

  def show
  end

  def new
    @areas = Area.new
  end

  def edit
  end

  def create
    @areas = Area.new(areas_params)

    respond_to do |f|
      if @areas.save
        f.html { redirect_to @areas, notice: 'Area created.' }
        f.json { render :show, status: :created, location: @areas }
      else
        f.html { render :new }
        f.json { render json: @areas.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @areas.update(areas_params)
        format.html { redirect_to @areas, notice: 'Area updated.' }
        format.json { render :show, status: :ok, location: @areas }
      else
        format.html { render :edit }
        format.json { render json: @areas.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @areas.destroy
    respond_to do |format|
      format.html { redirect_to areas_url, notice: 'Area destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_areas
    @areas = Area.find(params[:id])
  end

  def areas_params
    # add permitted params
    params.require(:areas).permit()
  end

end
