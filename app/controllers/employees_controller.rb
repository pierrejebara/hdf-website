class EmployeesController < ApplicationController
  before_action :get_index, only: [:edit, :update, :destroy]

  def index
    @employees = Employee.all
  end

  def new
    @employee = Employee.new
  end

  def create
    @employee = Employee.new(employee_params)
    @employee.user = current_user
    @employee.save
    redirect_to employees_path
  end

  def edit
  end

  def update
    @employee.update(employee_params)

    redirect_to employees_path
  end

  def destroy
    @employee.destroy

    redirect_to employees_path
  end

  private

  def get_index
    @employee = Employee.find(params[:id])
  end

  def employee_params
    params.require(:employee).permit(:name, :description, :email)
  end
end
