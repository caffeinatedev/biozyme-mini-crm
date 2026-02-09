class SalesController < ApplicationController
  before_action :set_sale, only: %i[edit update destroy]

  def index
    @sales = policy_scope(Sale).includes(:contact)
  end

  def new
    @sale = Sale.new
    authorize @sale
  end

  def create
    @sale = current_user.sales.build(sale_params)
    authorize @sale

    if @sale.save
      redirect_to sales_path, notice: "Sale recorded."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    authorize @sale
  end

  def update
    authorize @sale

    if @sale.update(sale_params)
      redirect_to sales_path, notice: "Sale updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    authorize @sale
    @sale.destroy
    redirect_to sales_path, notice: "Sale deleted."
  end

  private

  def set_sale
    @sale = Sale.find(params[:id])
  end

  def sale_params
    params.require(:sale).permit(:contact_id, :amount, :sold_on)
  end
end