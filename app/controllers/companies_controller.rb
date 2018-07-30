class CompaniesController < ApplicationController
    before_action :authorize_user!, only: [:create, :edit, :update]

    def index
        @companies = Company.search(params[:term]).order(name: :asc).paginate(:per_page => 10, :page => params[:page])
        @company = Company.all 

        @hash = Gmaps4rails.build_markers(@company) do |company, marker|
            marker.lat company.latitude
            marker.lng company.longitude
          end
    end

    def new
        @company = Company.new
    end
    
    def create
        @company = Company.new company_params
        @company.user = current_user 
      
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

=begin     def search(query)
        where("name ILIKE ?", "%#{query}%")
        .or(where("tag ILIKE ?", "%#{query}%"))
    end 
=end
    def destroy
        @company ||= Company.find params[:id]

        @company.destroy

        redirect_to admin_dashboard_organizations_path
    end

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

    def authorize_user!
        unless can?(:crud, @company)
            flash[:danger] = "Access Denied!"
            redirect_to company_path(@company)
        end
    end
end




    



   

     

   
