class ServicesController < ApplicationController
  before_action :set_service, only: [:show, :edit, :update, :destroy]

  # GET /services
  # GET /services.json
  def index
    @services = Service.all
    @budgets = Budget.all
  end

  # GET /services/1
  # GET /services/1.json
  def show
  end

  # GET /services/new
  def new
    @service = Service.new
    @user = User.where(:id => current_user.id).first
    new_number_of_transactions = @user.number_of_transactions.nil? ? 1:(@user.number_of_transactions + 1)

    new_number_of_transactions = @user.number_of_transactions.nil? ? 1:(@user.number_of_transactions + 1)
    @user.update_attribute(:number_of_transactions, new_number_of_transactions)

  end

  # GET /services/1/edit
  def edit
    @user = User.where(:id => current_user.id).first
    new_number_of_transactions = @user.number_of_transactions.nil? ? 1:(@user.number_of_transactions + 1)

    new_number_of_transactions = @user.number_of_transactions.nil? ? 1:(@user.number_of_transactions + 1)
    @user.update_attribute(:number_of_transactions, new_number_of_transactions)
  end

  # POST /services
  # POST /services.json
  def create
    @service = Service.new(service_params)
    @supplier = Supplier.where(:id => current_user.id).first
    if @supplier.nil?
      @supplier = Supplier.create(:id => current_user.id, :name => current_user.name, :address => current_user.address)
    end
    respond_to do |format|
      if @service.save
        format.html { redirect_to @service, notice: 'Service was successfully created.' }
        format.json { render :show, status: :created, location: @service }
      else
        format.html { render :new }
        format.json { render json: @service.errors, status: :unprocessable_entity }
      end
    end
    @user = User.where(:id => current_user.id).first
    new_number_of_transactions = @user.number_of_transactions.nil? ? 1:(@user.number_of_transactions + 1)

    new_number_of_transactions = @user.number_of_transactions.nil? ? 1:(@user.number_of_transactions + 1)
    @user.update_attribute(:number_of_transactions, new_number_of_transactions)

  end

  # PATCH/PUT /services/1
  # PATCH/PUT /services/1.json
  def update
    respond_to do |format|
      if @service.update(service_params)
        format.html { redirect_to @service, notice: 'Service was successfully updated.' }
        format.json { render :show, status: :ok, location: @service }
      else
        format.html { render :edit }
        format.json { render json: @service.errors, status: :unprocessable_entity }
      end
    end
    @user = User.where(:id => current_user.id).first
    new_number_of_transactions = @user.number_of_transactions.nil? ? 1:(@user.number_of_transactions + 1)

    new_number_of_transactions = @user.number_of_transactions.nil? ? 1:(@user.number_of_transactions + 1)
    @user.update_attribute(:number_of_transactions, new_number_of_transactions)

  end

  # DELETE /services/1
  # DELETE /services/1.json
  def destroy
    @service.destroy
    respond_to do |format|
      format.html { redirect_to services_url, notice: 'Service was successfully destroyed.' }
      format.json { head :no_content }
    end
    @user = User.where(:id => current_user.id).first
    new_number_of_transactions = @user.number_of_transactions.nil? ? 1:(@user.number_of_transactions + 1)

    new_number_of_transactions = @user.number_of_transactions.nil? ? 1:(@user.number_of_transactions + 1)
    @user.update_attribute(:number_of_transactions, new_number_of_transactions)

  end

  def hire

    @budget = Budget.create(
      :requested_service => params[:service_type],
      :hirer_id => current_user.id,
      :hirer_name => current_user.name,
      :supplier_id => params[:supplier_id],
      :supplier_name => params[:supplier_name],
      :budget_status => "Aguardando fornecedor",
      :budget_price => params[:service_price],
      :days_of_service => "Aguardando fornecedor",
      :aditional_information => params[:aditional_information],
     )
    @budget.save

    @hirer = Hirer.create(:id => current_user.id, :name => current_user.name, :address => current_user.address)
    @user = User.where(:id => current_user.id).first
    new_number_of_transactions = @user.number_of_transactions.nil? ? 1:(@user.number_of_transactions + 1)

    new_number_of_transactions = @user.number_of_transactions.nil? ? 1:(@user.number_of_transactions + 1)
    @user.update_attribute(:number_of_transactions, new_number_of_transactions)
    redirect_to services_url
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_service
      @service = Service.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def service_params
      params.require(:service).permit(:service_type, :hirer_id, :hirer_name, :supplier_id, :supplier_name, :service_status, :service_price, :aditional_information)
    end


end
