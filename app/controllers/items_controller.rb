class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update, :destroy]

  # GET /items/1
  def show
    @list = List.find(params[:list_id])
  end

  # GET /items/new
  def new
    @list = List.find(params[:list_id])
    @item = Item.new
    @repeated = []
  end

  # GET /items/1/edit
  def edit
    @list = List.find(params[:list_id])
    #@item.repeat.split(" ")
  end

  # POST /items
  def create
    @list = List.find(params[:list_id])
    params[:item][:list_id] = @list[:id]
    i = params[:item][:repeat]
    i.delete("0")
    params[:item][:repeat] = i.join(" ")
    @item = Item.new(item_params)

    if @item.save
      redirect_to users_show_path, notice: 'Hello'
    else
      render :new
    end
  end

  # PATCH/PUT /items/1
  def update
    i = params[:item][:repeat]
    i.delete("0")
    params[:item][:repeat] = i.join(" ")

    if @item.update(item_params)
      redirect_to users_show_path, notice: @item.repeat
    else
      render :edit
    end
  end

  # DELETE /items/1
  def destroy
    @item.destroy
    redirect_to users_show_path, notice: 'Item was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_item
      @item = Item.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def item_params
      params.require(:item).permit(:name, :description, :user_id, :create_by, :list_id, :priority, :duration, :repeat, :due, :active, :start)
    end
end
