class PagesController < ApplicationController
  def home
    @schools = School.all
  end
end
