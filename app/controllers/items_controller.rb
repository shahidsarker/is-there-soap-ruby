class ItemsController < ApplicationController
  before_action :set_items, only: [:show, :edit, :update, :destroy]

  def index
    @items = Item.all
  end

  def show
  end

  def new
    @items = Item.new
  end

  def edit
  end

  def create
    @items = Item.new(items_params)

    respond_to do |f|
      if @items.save
        f.html { redirect_to @items, notice: 'Item created.' }
        f.json { render :show, status: :created, location: @items }
      else
        f.html { render :new }
        f.json { render json: @items.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @items.update(items_params)
        format.html { redirect_to @items, notice: 'Item updated.' }
        format.json { render :show, status: :ok, location: @items }
      else
        format.html { render :edit }
        format.json { render json: @items.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @items.destroy
    respond_to do |format|
      format.html { redirect_to items_url, notice: 'Item destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_items
    @items = Item.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def items_params
    params.require(:items).permit()
  end
end
