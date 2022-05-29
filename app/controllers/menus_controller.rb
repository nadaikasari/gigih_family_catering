require 'logger'
require 'json'

class MenusController < ApplicationController
  before_action :set_menu, only: %i[ show edit update destroy ]

  def index
    @menus = params[:id].nil? ? Menu.all : Menu.by_id(params[:id])
    logger = Logger.new(STDOUT)
    logger.formatter = proc do |severity, datetime, progname, msg|
      date_format = datetime.strftime('%Y-%m-%d %H:%M:%S')
      JSON.dump(
        date: date_format,
        severity: severity.ljust(5).to_s,
        pid: Process.pid.to_s,
        message: msg,
        progname: progname.to_s
      ) + "\n"
    end

    logger.level = Logger::WARN
    # logger.debug("Fetch #{@menus.count} menus")
    logger.info('This is info')
    logger.warn('This is warn')
    logger.error('This is error')
    logger.fatal('This is fatal')
  end

  def show
  end

  def new
    @menu = Menu.new
  end

  def edit
  end

  def create
    @menu = Menu.new(menu_params)

    respond_to do |format|
      if @menu.save
        format.html { redirect_to menu_url(@menu), notice: "Menu was successfully created." }
        format.json { render :show, status: :created, location: @menu }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @menu.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @menu.update(menu_params)
        format.html { redirect_to menu_url(@menu), notice: "Menu was successfully updated." }
        format.json { render :show, status: :ok, location: @menu }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @menu.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @menu.destroy

    respond_to do |format|
      format.html { redirect_to menus_url, notice: "Menu was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    def set_menu
      @menu = Menu.find(params[:id])
    end

    def menu_params
      params.fetch(:menu, {}).permit(:name, :description, :price, category: [])
    end
end
