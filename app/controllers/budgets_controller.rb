class BudgetsController < ApplicationController
  before_action :set_budget, only: %i[edit update destroy]

  def index
    @budgets = policy_scope(Budget).includes(:contact)
  end

  def new
    @budget = Budget.new
    authorize @budget
  end

  def create
    @budget = current_user.budgets.build(budget_params)
    authorize @budget

    if @budget.save
      redirect_to budgets_path, notice: "Budget set successfully."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    authorize @budget
  end

  def update
    authorize @budget

    if @budget.update(budget_params)
      redirect_to budgets_path, notice: "Budget updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    authorize @budget
    @budget.destroy
    redirect_to budgets_path, notice: "Budget deleted."
  end

  private

  def set_budget
    @budget = Budget.find(params[:id])
  end

  def budget_params
    params.require(:budget).permit(:contact_id, :year, :amount)
  end
end