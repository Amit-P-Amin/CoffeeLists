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

    private

      def item_params
        params.require(:item).permit(:title, :content, :id)
      end

  end
end
