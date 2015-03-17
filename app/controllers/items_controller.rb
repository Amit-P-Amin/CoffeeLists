class ItemsController < ApplicationController
  def update
    @item = Item.find_by_id(params[:id])
    @item.update(item_params)

    if @item.save
      render json: @item
    else
      render json: @item.errors.full_messages, status: 406
    end
  end

  private

    def item_params
      params.require(:item).permit(:title, :content)
    end

end
