class CashesController < ApplicationController
  before_action :set_cash, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource

  # GET /cashes
  # GET /cashes.json
  def index
    @cashes = Cash.all
  end

  # GET /cashes/1
  # GET /cashes/1.json
  def show
  end

  # GET /cashes/new
  def new
    @cash = Cash.new
    @cash.state = false
  end

  # GET /cashes/1/edit
  def edit
  end

  # POST /cashes
  # POST /cashes.json
  def create
    @cash = Cash.new(cash_params)

    respond_to do |format|
      if @cash.save
        format.html { redirect_to cashes_path, notice: 'Caja creada exitosamente.' }
        format.json { render :show, status: :created, location: @cash }
      else
        format.html { render :new }
        format.json { render json: @cash.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /cashes/1
  # PATCH/PUT /cashes/1.json
  def update
    respond_to do |format|
      if @cash.update(cash_params)
        format.html { redirect_to cashes_path, notice: 'Caja actualizada exitosamente.' }
        format.json { render :show, status: :ok, location: @cash }
      else
        format.html { render :edit }
        format.json { render json: @cash.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cashes/1
  # DELETE /cashes/1.json
  def destroy
    @cash.destroy
    respond_to do |format|
      format.html { redirect_to cashes_url, notice: 'Caja fue eliminada exitosamente.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cash
      @cash = Cash.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def cash_params
      params.require(:cash).permit(:description, :state)
    end
end
