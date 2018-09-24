class AreaItemsController < ApplicationController
  before_action :set_area_item, only: [:show, :edit, :update, :destroy, :full, :half, :empty]

  def index
    @area_items = AreaItem.all
  end

  def show
  end

  def new
    @area_item = AreaItem.new
  end

  def edit
  end

  def create
    @area_item =AreaItem.new(area_items_params)

    respond_to do |format|
      if @area_item.save
        format.html {redirect_to @area_item, notice: 'Item added to area.'}
        format.json { render :show, status: :created, location: @area_item}
      else
        format.html { render :new}
        format.json {render json: @area_item.errors, status: :unprocessable_entity}
      end
    end
  end

  def update
    respond_to do |format|
      if @area_item.update(area_items_params)
        format.html {redirect_to @area_item, notice: 'Item added to area.'}
        format.json {render :show, status: :ok, location: @area_item}
      end
    end
  end

  def destroy
    @area_item.destroy
    respond_to do |format|
      format.html {redirect_to area_items_url, notice: 'Item removed from area.'}
      format.json {head :no_content}
    end
  end

  def full
    @area_item = AreaItem.find(params[:id])
    @area_item.update(status: 1)
    redirect_back(fallback_location: root_path)
  end

  def half
    @area_item = AreaItem.find(params[:id])
    @area_item.update(status: 0.5)
    redirect_back(fallback_location: root_path)
  end

  def empty
    @area_item = AreaItem.find(params[:id])
    @area_item.update(status: 0)
    redirect_back(fallback_location: root_path)
  end

  private

  def set_area_item
    @area_item = AreaItem.find(params[:id])
  end

  def area_item_params
    params.require(:area_item).permit(:area_id, :item_id, :status)
  end
end
