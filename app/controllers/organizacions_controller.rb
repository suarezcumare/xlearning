class OrganizacionsController < ApplicationController
  before_action :set_organizacion, only: [:show, :edit, :update, :destroy]

  # GET /organizacions
  # GET /organizacions.json
  def index
    @organizacions = Organizacion.all
  end

  # GET /organizacions/1
  # GET /organizacions/1.json
  def show
  end

  # GET /organizacions/new
  def new
    @organizacion = Organizacion.new
  end

  # GET /organizacions/1/edit
  def edit
  end

  # POST /organizacions
  # POST /organizacions.json
  def create
    @organizacion = Organizacion.new(organizacion_params)

    respond_to do |format|
      if @organizacion.save
        format.html { redirect_to @organizacion, notice: 'Organizacion was successfully created.' }
        format.json { render :show, status: :created, location: @organizacion }
      else
        format.html { render :new }
        format.json { render json: @organizacion.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /organizacions/1
  # PATCH/PUT /organizacions/1.json
  def update
    respond_to do |format|
      if @organizacion.update(organizacion_params)
        format.html { redirect_to @organizacion, notice: 'Organizacion was successfully updated.' }
        format.json { render :show, status: :ok, location: @organizacion }
      else
        format.html { render :edit }
        format.json { render json: @organizacion.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /organizacions/1
  # DELETE /organizacions/1.json
  def destroy
    @organizacion.destroy
    respond_to do |format|
      format.html { redirect_to organizacions_url, notice: 'Organizacion was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_organizacion
      @organizacion = Organizacion.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def organizacion_params
      params.require(:organizacion).permit(:nombre, :subdominio, :estatus)
    end
end
