class SchoolsController < ApplicationController
  def show
    @toys = School.find(params[:id]).toys
  end
end
