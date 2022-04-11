class MaterialLogsController < ApplicationController
  before_action :set_material
  before_action :set_material_log, only: %i[update]

  # GET /material_logs or /material_logs.json
  def index
    @material_logs = @material.material_logs.page(params[:page]).per(10)
  end

  # GET /material_logs/new
  def new
    @material_log = @material.material_logs.new
  end


  # POST /material_logs or /material_logs.json
  def create
    @material_log = @material.material_logs.new(material_log_params)
    @material_log.user_id = current_user.id

    if @material_log.save!

      redirect_to material_material_logs_path(material_id: @material.id)
    else
      render new
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_material
      @material = Material.find(params[:material_id])
    end

    # def set_material_log
    #   @material_log = @material.material_logs.find(params[:id]) 
    # end
    # Only allow a list of trusted parameters through.
    def material_log_params
      params.require(:material_log).permit(:material_id, :user_id, :quantity, :action)
    end
end
