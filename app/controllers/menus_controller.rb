class MenusController < ApplicationController
  def index
    @menus = params[:letter].nil? ? Menu.all : Menu.by_letter(params[:letter])
  end

  def show
  end

  def new
  end

  def edit
  end
end
