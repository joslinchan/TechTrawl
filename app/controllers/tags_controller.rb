class TagsController < ApplicationController


    def create
        @tag = Tag.new tag_params 
        
        if @tag.save
            flash[:success] = "Tag created!"
            redirect_to admin_dashboard_technologies_path
        else
            redirect_to admin_dashboard_technologies_path
        end
    end

    def destroy
        @tag = Tag.find params[:id]
        @tag.destroy
        flash[:success] = "Tag removed"
        redirect_to admin_dashboard_technologies_path
    end

    private
    def tag_params
        params.require(:tag).permit(:name)
    end
end

