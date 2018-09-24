class AreasController < ApplicationController
  before_action :set_area, only: [:show, :edit, :update, :destroy]

  def index
    @areas = Area.all
  end

  def show
  end

  def new
    @area = Area.new
  end

  def edit
  end

  def create
    @area = Area.new(area_params)

    respond_to do |f|
      if @area.save
        f.html { redirect_to @area, notice: 'Area created.' }
        f.json { render :show, status: :created, location: @area }
      else
        f.html { render :new }
        f.json { render json: @area.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @area.update(area_params)
        format.html { redirect_to @area, notice: 'Area updated.' }
        format.json { render :show, status: :ok, location: @area }
      else
        format.html { render :edit }
        format.json { render json: @area.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @area.destroy
    respond_to do |format|
      format.html { redirect_to areas_url, notice: 'Area destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_area
    @area = Area.find(params[:id])
  end

  def area_params
    # add permitted params
    params.require(:area).permit(:name, :description,:space_id, :image)
  end

end
