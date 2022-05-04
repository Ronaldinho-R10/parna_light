class LocaisController < ApplicationController
  before_action :set_local, only: %i[ show edit update destroy ]
  before_action :set_bairro_options, only: [:new, :create ,:edit, :update]

  # GET /locais or /locais.json
  def index
    @locais = Local.all
  end

  # GET /locais/1 or /locais/1.json
  def show
  end

  # GET /locais/new
  def new
    @local = Local.new
  end

  # GET /locais/1/edit
  def edit
  end

  # POST /locais or /locais.json
  def create
    @local = Local.new(local_params)

    respond_to do |format|
      if @local.save
        format.html { redirect_to local_url(@local), notice: "Local was successfully created." }
        format.json { render :show, status: :created, location: @local }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @local.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /locais/1 or /locais/1.json
  def update
    respond_to do |format|
      if @local.update(local_params)
        format.html { redirect_to local_url(@local), notice: "Local was successfully updated." }
        format.json { render :show, status: :ok, location: @local }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @local.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /locais/1 or /locais/1.json
  def destroy
    @local.destroy

    respond_to do |format|
      format.html { redirect_to locais_url, notice: "Local was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_local
      @local = Local.find(params[:id])
    end


    def set_bairro_options
      @bairro_options = Local.all.pluck(:bairro, :id)
   end


    # Only allow a list of trusted parameters through.
    def local_params
      params.require(:local).permit(:bairro, :referencia, :logradouro, :numero, :rua)
    end
end
