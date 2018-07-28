class CompaniesController < ApplicationController

    def index
        @companies = Company.all
    end

    def new
    end

    def create
    end

    def update
    end

    def show
        # @company = Company.find_by_user_id(current_user.id)
        @company = Company.find_by_owner_id(User.last.id)
        # @company_user_id = current_user.id

    end

    def edit
    end

end
