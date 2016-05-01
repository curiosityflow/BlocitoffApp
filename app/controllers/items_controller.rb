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
		@todo = Item.create(item_params)
		redirect_to '/items#index'
	end

  def edit
    @todo = Item.find(params[:id])
  end

  def update
    @todo = Item.find(params[:id])
    if @todo.update(item_params)
      redirect_to items_url, :notice => "Item Updated"
    else
      redirect_to items_url, :notice => "Could not update Item"
    end
  end

  def destroy
    @todo = Item.find(params[:id])
    @todo.destroy

    redirect_to items_url, :notice => "Item deleted!"
  end

  private
  def item_params
    params.require(:item).permit(:description, :done)
  end
end
