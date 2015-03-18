module Api
  class ItemsController < ApplicationController
    def index
      render json: Item.build_branch(Item.root)
    end

    def update
      @item = Item.find_by_id(params[:id])
      @item.update(item_params)

      if @item.save
        render json: @item.build_node
      else
        render json: @item.errors.full_messages, status: 406
      end
    end

    def re_order
      @item = Item.find_by_id(params[:currentItemId])
      @priorItem = Item.find_by_id(params[:priorItemId])
      
      if @item.parent_id != @priorItem.parent_id
        @item.swap_list(@priorItem)
      else
        @item.swap_position(@priorItem)
      end

      render json: @item
    end

    private

      def item_params
        params.require(:item).permit(:title, :content, :id)
      end

  end
end
