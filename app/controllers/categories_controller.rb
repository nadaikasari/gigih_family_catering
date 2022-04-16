class CategoriesController < ApplicationController
  def index
    @categories = params[:letter].nil? ? Category.all : Category.by_letter(params[:letter])
  end

  def show
    @category = Category.find(params[:id])
  end

  def new
    @category = Category.new
  end

  def edit
  end
end
