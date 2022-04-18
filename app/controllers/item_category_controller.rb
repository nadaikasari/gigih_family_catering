class ItemCategoryController < ApplicationController

  before_action :set_item_category, only: [:show, :edit, :update, :destroy ]
  
  def index
    @item_categories = params[:id].nil? ? ItemCategory.all : ItemCategory.by_id(params[:id])
  end

  def show
  end

  def new
  end

  def edit
  end

  private
  def set_item_category
    @item_category = ItemCategory.find(params[:id])
  end
  
  def category_params
    params.require(:item_category).permit(:menu_id, :category_id)
  end
  
end
