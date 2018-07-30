class Admin::DashboardController < ApplicationController
  before_action :authorize_admin!

  def index
    @users = User.all
  end

  def organizations
    @companies = Company.all
  end

  def technologies
    @tag = Tag.new
    @tags = Tag.all
  end

  def users
    @users = User.all
  end

  def events
    @events = Event.all
  end

  private
  def authorize_admin!
    unless current_user.admin?
      flash[:danger] = "Access Denied"
      redirect_to home_path
    end
  end
end