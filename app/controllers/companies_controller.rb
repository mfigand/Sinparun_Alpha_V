class CompaniesController < ApplicationController

    before_action :authenticate_companies!, except: :update

  def index
    @allCompanies = Company.all
  end

  def new
    @company = Company.new company_params
  end

  def create
    @company = Company.new company_params
    if @company.save
      flash[:notice] = "Company created succesfully"
      render 'show'
    else
      flash[:alert] = "ALERT Company not created"
      render 'new'
    end
  end

  def show
    @company = Company.find(params[:id])
  end

  def destroy
    @company = Company.find(params[:id])
    @company.destroy
    redirect_to root_path
  end


private

  def company_params
    params.require(:company).permit(:name, :email, :password, :password_confirmation)
  end

end
