class VehiclesController < ApplicationController
  before_action :set_vehicle, only: %i[ show edit update destroy ]

  # GET /vehicles or /vehicles.json
  def index
    @vehicles = Vehicle.all
  end

  # GET /vehicles/1 or /vehicles/1.json
  def show
  end

  # GET /vehicles/new
  def new
    @vehicle = Vehicle.new
    @modes = Mode.all.order(:name)
  end

  # GET /vehicles/1/edit
  def edit
    @modes = Mode.all.order(:name)
  end

  # POST /vehicles or /vehicles.json
  def create
    @vehicle = Vehicle.new(vehicle_params)
    if @vehicle.save
      flash[:notice] = "Vehicle created successfully."
      return redirect_to vehicles_path
    end
    @modes = Mode.all.order(:name)
    flash.now[:alert] = 
"Error while creating the vehicle."
    render :new, status: :unprocessable_entity
  end

  # PATCH/PUT /vehicles/1 or /vehicles/1.json
  def update
    if @vehicle.update(vehicle_params)
      flash[:notice] = "Vehicle updated successfully"
      return redirect_to @vehicle
    end
    @modes = Mode.all.order(:name)
    flash.now[:alert] = "Error while updating the vehicle"
    render :edit, status: :unprocessable_entity
  end

  # DELETE /vehicles/1 or /vehicles/1.json
  def destroy
    if @vehicle.destroy
      flash[:notice] = "Vehicle deleted successfully"
      return redirect_to vehicles_path
    end
    flash.now[:alert] = "Error while deleting the vehicle"
    render :show, status: :unprocessable_entity
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_vehicle
      @vehicle = Vehicle.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def vehicle_params
      params.require(:vehicle).permit(:mode_id, :plate, :brand, :model, :category, :year, :capacity, :status)
    end
end
