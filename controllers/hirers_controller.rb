class HirersController < ApplicationController
  before_action :set_hirer, only: [:show, :edit, :update, :destroy]

  # GET /hirers
  # GET /hirers.json
  def index
    @hirers = Hirer.all
  end

  # GET /hirers/1
  # GET /hirers/1.json
  def show
  end

  # GET /hirers/new
  def new
    @hirer = Hirer.new
  end

  # GET /hirers/1/edit
  def edit
  end

  # POST /hirers
  # POST /hirers.json
  def create
    @hirer = Hirer.new(hirer_params)

    respond_to do |format|
      if @hirer.save
        format.html { redirect_to @hirer, notice: 'Hirer was successfully created.' }
        format.json { render :show, status: :created, location: @hirer }
      else
        format.html { render :new }
        format.json { render json: @hirer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /hirers/1
  # PATCH/PUT /hirers/1.json
  def update
    respond_to do |format|
      if @hirer.update(hirer_params)
        format.html { redirect_to @hirer, notice: 'Hirer was successfully updated.' }
        format.json { render :show, status: :ok, location: @hirer }
      else
        format.html { render :edit }
        format.json { render json: @hirer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /hirers/1
  # DELETE /hirers/1.json
  def destroy
    @hirer.destroy
    respond_to do |format|
      format.html { redirect_to hirers_url, notice: 'Hirer was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_hirer
      @hirer = Hirer.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def hirer_params
      params.require(:hirer).permit(:name, :address)
    end
end
