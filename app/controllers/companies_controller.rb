class CompaniesController < ApplicationController

    def index
        @companies = if params[:term]
            Company.where("name ILIKE ?", "%#{params[:term]}%")
        else
            @companies = Company.all
        end
    end

    def new
        @company = Company.new
    end
    
    def create
        @company = Company.new company_params
        @company.user = User.last 
      
        # render json: @company
        if @company.save
            flash[:success] = "Company created!"
            redirect_to company_path(@company)
        else
            render "companies/new"
        end
        
    end
    
    def edit
        @company = Company.find params[:id]
    end

    def update
        @company = Company.find params[:id]
        if @company.update(company_params)
            redirect_to company_path(@company.id)
          else
            render :edit
          end 
    end

    def show
         @company = Company.find(params[:id])
        
    end


    def edit
    end

=begin     def search(query)
        where("name ILIKE ?", "%#{query}%")
        .or(where("tag ILIKE ?", "%#{query}%"))
    end 
=end

    private
    def company_params
        params.require(:company).permit(:name, 
            :address, 
            :postal_code,
            :overview, 
            :employees, 
            :tech_team, 
            :website,       
            :twitter,
            :logo, 
            :published, 
            :user_id,
            :term,
            tag_ids: [])
      end
end




