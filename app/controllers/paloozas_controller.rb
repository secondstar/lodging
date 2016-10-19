class PaloozasController < ApplicationController
  before_action :set_palooza, only: [:show, :edit, :update, :destroy]
  before_action :all_paloozas, only: [:index, :create, :update, :destroy]
  respond_to :html, :js

  # GET /paloozas
  def index
    @paloozas = Palooza.all
    # gon.hotels = Hotel.limit(10)
    
    respond_to do |format|
      format.html
      format.json
    end
  end

  # GET /paloozas/1
  def show
  end

  # GET /paloozas/new
  def new
    @palooza = Palooza.new
  end

  # GET /paloozas/1/edit
  def edit
  end

  # POST /paloozas
  def create
    @palooza = Palooza.new(palooza_params)

    if @palooza.save
      redirect_to @palooza, notice: 'Palooza was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /paloozas/1
  def update
    if @palooza.update(palooza_params)
      redirect_to @palooza, notice: 'Palooza was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /paloozas/1
  def destroy
    @palooza.destroy
    redirect_to paloozas_url, notice: 'Palooza was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_palooza
      @palooza = Palooza.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def palooza_params
      params.require(:palooza).permit(:name, :lat, :lng)
    end
end
