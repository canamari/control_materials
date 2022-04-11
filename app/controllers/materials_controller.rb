class MaterialsController < ApplicationController
  before_action :set_material, only: %i[ show edit update destroy ]

  # GET /materials or /materials.json
  def index
    @materials = Material.all.page(params[:page]).per(10)
  end

  # GET /materials/1 or /materials/1.json
  def show
  end

  # GET /materials/new
  def new
    @material = Material.new

  end

  # GET /materials/1/edit
  def edit
  end

  # POST /materials or /materials.json
  def create
    @material = Material.new(material_params)

    if @material.save!
      redirect_to materials_path
    else
      render new
    end
  end

  # PATCH/PUT /materials/1 or /materials/1.json
  def update
    @material.update(material_params)
    if @material.save!
      redirect_to materials_path
    else
      render edit
    end
  end

  # DELETE /materials/1 or /materials/1.json
  def destroy
    if @material.material_logs.present?
      errors.add(:name, "Material possui log")
    else
      @material.destroy
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_material
      @material = Material.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def material_params
      params.require(:material).permit(:name)
    end
end
