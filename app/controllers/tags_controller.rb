class TagsController < ApplicationController


    def destroy
        @tag = Tag.find params[:id]
        @tag.destroy
        flash[:success] = "Tag removed"
        redirect_to admin_dashboard_technologies_path
    end
end

