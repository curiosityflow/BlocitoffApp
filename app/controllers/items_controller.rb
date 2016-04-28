class ItemsController < ApplicationController
  before_action :authenticate_user!

  def index
    @todos = Item.where(done: false)
    @todone = Item.where(done: true)
  end

  def new
    @todo = Item.new
  end

  def create
    @todo = Item.new(item_params)

    if @todo.save
      redirect_to item_index_path, :notice => "New item added!"
    else
      render 'new'
    end
  end

  def update
    @todo = Item.find(params[:id])
    if @todo.update_attribute(:done, true)
      redirect_to item_index_path, :notice => "Item marked as done!"
    else
      redirect_to item_index_path, :notice => "Unable to be marked as done!"
    end
  end

  def destroy
    @todo = Item.find(params[:id])
    @todo.destroy

    redirect_to item_index_path, :notice => "Item deleted!"
  end

  private
  def item_params
    params.require(:item).permit(:description, :done)
  end
end
