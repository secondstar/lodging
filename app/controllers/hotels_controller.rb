class HotelsController < ApplicationController
  before_action :set_hotel, only: [:show, :edit, :update, :destroy]

  # GET /hotels
  def index
    @hotels = Hotel.all
    @hotel_groups = @hotels.select(:id, :name, :category_code).group_by {|h| h.category_code}
    @geojson = Hotel.geojson
    respond_to do |format|
      format.html
      format.js
      format.json { render json: @geojson }  # respond with the created JSON object
    end
    
  end

  # GET /hotels/1
  def show
    render layout: "application"
  end

  # GET /hotels/new
  def new
    @hotel = Hotel.new
  end

  # GET /hotels/1/edit
  def edit
  end

  # POST /hotels
  def create
    @hotel = Hotel.new(hotel_params)

    if @hotel.save
      redirect_to @hotel, notice: 'Hotel was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /hotels/1
  def update
    if @hotel.update(hotel_params)
      redirect_to @hotel, notice: 'Hotel was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /hotels/1
  def destroy
    @hotel.destroy
    redirect_to hotels_url, notice: 'Hotel was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_hotel
      @hotel = Hotel.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def hotel_params
      params.require(:hotel).permit(:name, :address, :city, :state_code, :zip_code, :phone_number, :url, :off_site, :water_sports, :marina, :beach, :tennis, :biking, :suites, :concierge_floor, :room_service, :wired_internet, :wireless_internet, :num_rooms, :cost_range, :shuttle_to_parks, :cost_estimate, :lodging_area_code, :category_code)
    end
end
