class CompaniesController < ApplicationController

    before_action :authenticate_company!, except: :update

  # def index
  #   @allCompanies = Company.all
  # end

  # def new
  #   @company = Company.new company_params
  # end

  # def create
  #   @company = Company.new company_params
  #   if @company.save
  #     flash[:notice] = "Company created succesfully"
  #     render 'show'
  #   else
  #     flash[:alert] = "ALERT Company not created"
  #     render 'new'
  #   end
  # end

  def edit
    @company = Company.find(params[:id])
  end

  def update
    @company = Company.find(params[:id])

    if @company.update_attributes company_params
      redirect_to action: :index
    else
      render "edit"
    end
  end

  def show
    @company = Company.find(params[:id])
    @branches = @company.branches
    @rewards = @company.rewards
  end

  def destroy
    @company = Company.find(params[:id])
    @company.destroy
    redirect_to root_path
  end
  
  def branches_map
    @company = Company.find(params[:company_id])
    @branches = @company.branches
  end


private

  def company_params
    params.require(:company).permit(:name, :email, :password, :password_confirmation)
  end

end
