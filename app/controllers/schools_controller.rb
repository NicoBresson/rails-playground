class SchoolsController < ApplicationController
  skip_before_action :authenticate_user!, only: :show
  def show
    @toys = School.find(params[:id]).toys
  end
end
