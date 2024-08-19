class DeadlinesController < ApplicationController
  before_action :set_deadline, only: %i[edit update destroy ]
  before_action :set_modes, only: %i[new create edit]
  # GET /deadlines or /deadlines.json
  def index
    @deadlines = Deadline.all
  end


  # GET /deadlines/new
  def new
    @deadline = Deadline.new
  end

  # GET /deadlines/1/edit
  def edit
  end

  # POST /deadlines or /deadlines.json
  def create
    @deadline = Deadline.new(deadline_params)
    if @deadline.save
      flash[:notice] = 'Deadline created successfully'
      return redirect_to deadlines_path
    end
    @modes = Mode.all.order(:name)
    flash.now[:alert] = 'Error creating deadline'
    render :new, status: :unprocessable_entity
  end

  # PATCH/PUT /deadlines/1 or /deadlines/1.json
  def update
    if @deadline.update(deadline_params)
      flash[:notice] = "Deadline updated successfully"
      return redirect_to deadlines_path
    end
    @modes = Mode.all.order(:name)
    flash.now[:alert] = "Error updating deadline"
    render :edit, status: :unprocessable_entity
  end

  def destroy
    if @deadline.destroy
      flash[:notice] = "Deadline deleted successfully"
      return redirect_to deadlines_path
    end
    flash.now[:alert] = "Error deleting deadline"
    render :index, status: :unprocessable_entity    
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_deadline
      @deadline = Deadline.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def deadline_params
      params.require(:deadline).permit(:min_distance, :max_distance, :deadline, :mode_id)
    end

    def set_modes
      @modes = Mode.all.order(:name)
    end
end
