class Admin::DashboardController < ApplicationController
  before_action :authorize_admin!

  def index
    @users = User.all
  end

  def organizations
    @companies = Company.all
  end

  def technologies
    @tags = Tag.all
  end

  private
  def authorize_admin!
    unless current_user.admin?
      flash[:danger] = "Access Denied"
      redirect_to home_path
    end
  end
end
