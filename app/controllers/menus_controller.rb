class MenusController < ApplicationController

  before_action :set_menu, only: [:show, :edit, :update, :destroy ]
  
  def index
    @menus = params[:letter].nil? ? Menu.all : Menu.by_letter(params[:letter])
  end

  def show
  end

  def new
    @menu = Menu.new
  end

  def edit
  end

  private
  def set_menu
    @menu = Menu.find(params[:id])
  end
  
  def menu_params
    params.require(:menu).permit(:name)
  end
end
