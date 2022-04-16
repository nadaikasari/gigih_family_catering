class CategoriesController < ApplicationController
  def index
    @categories = params[:letter].nil? ? Category.all : Category.by_letter(params[:letter])
  end

  def show
  end

  def new
  end

  def edit
  end
end
