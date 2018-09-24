class AreaItemsController < ApplicationController
  before_action :set_area_item, only: [:show, :edit, :update, :destroy]

  def index
    @area_items = AreaItem.all
  end

  def show
  end

  def new
    @area_items = AreaItem.new
  end

  def edit
  end

  def create
    @area_items =AreaItem.new(area_items_params)

    respond_to do |format|
      if @area_items.save
        format.html {redirect_to @area_items, notice: 'Item added to area.'}
        format.json { render :show, status: :created, location: @area_items}
      else
        format.html { render :new}
        format.json {render json: @area_items.errors, status: :unprocessable_entity}
      end
    end
  end

  def update
    respond_to do |format|
      if @area_items.update(area_items_params)
        format.html {redirect_to @area_items, notice: 'Item added to area.'}
        format.json {render :show, status: :ok, location: @area_items}
      end
    end
  end

  def destroy
    @area_items.destroy
    respond_to do |format|
      format.html {redirect_to area_items_url, notice: 'Item removed from area.'}
      format.json {head :no_content}
    end
  end

  private

  def set_area_items
    @area = Area.find(params[:id])
  end

  def area_items_params
    params.require(:area_items).permit(:area_id, :item_id, :status)
  end
end
