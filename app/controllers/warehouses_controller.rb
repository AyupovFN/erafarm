class WarehousesController < ApplicationController
  before_action :set_warehouse, except: %i[ new create ]

  def index
    @warehouses = Warehouse.all
  end

  def show
  end

  def new
    @warehouse = Warehouse.new
  end

  def edit
  end

  def create
    @warehouse = Warehouse.new(warehouse_params)

    respond_to do |format|
      if @warehouse.save
        format.html { redirect_to @warehouse, notice: "Warehouse was successfully created." }
        format.json { render :show, status: :created, location: @warehouse }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @warehouse.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @warehouse.update(warehouse_params)
        format.html { redirect_to @warehouse, notice: "Warehouse was successfully updated." }
        format.json { render :show, status: :ok, location: @warehouse }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @warehouse.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @warehouse.destroy
    respond_to do |format|
      format.html { redirect_to warehouses_url, notice: "Warehouse was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def acceptance_form
    @form = AcceptanceForm.new
  end

  def accept
    @form = AcceptanceForm.new(acceptance_params)
    if @form.process
      redirect_to warehouse_path, notice: 'Accepted'
    else
      render :acceptance_form, alert: 'Something went wrong'
    end
  end

  def disposal_form
    @form = DisposalForm.new
  end

  def dispose
    @form = DisposalForm.new(disposal_params)
    if @form.process
      redirect_to warehouse_path, notice: 'Disposed'
    else
      render :disposal_form, alert: 'Something went wrong'
    end

  end

  private
    def set_warehouse
      @warehouse = Warehouse.find(params[:id])
    end
    def warehouse_params
      params.require(:warehouse).permit(:name, :address)
    end
  def acceptance_params
    params.require(:acceptance_form).permit(:product_id, :count)
  end
  def disposal_params
    params.require(:disposal_form).permit(:product_id, :count)
  end
end
