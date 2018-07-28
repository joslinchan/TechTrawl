class CompaniesController < ApplicationController

    def index
    end

    def new
        @company = Company.new
    end
    
    def create
        @company = Company.new company_params
        @company.user = User.last 
      

        if @company.save
            flash[:success] = "Company created!"
            redirect_to company_path(@company)
        else
            render "companies/new"
        end
        
    end

    def update
    end

    def show
    end

    def edit
    end

    private
    def company_params
    
        params.require(:company).permit(:name, 
            :adress, 
            :postal_code,
            :overview, 
            :employees, 
            :tech_team, 
            :website,       
            :twitter,
            :logo, 
            :published, 
            :user_id,
            tag_ids: [])
      end
end




