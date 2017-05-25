class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :search]
  def home
    @schools = School.where.not(latitude: nil)
    @hash = Gmaps4rails.build_markers(@schools) do |school, marker|
      marker.lat school.latitude
      marker.lng school.longitude
      marker.infowindow render_to_string(partial: "/pages/school_map_box", locals: { school: school })
    end
  end

  def search
    @address = params[:search]
    @schools_near = School.near(@address, 1)
    @hash = Gmaps4rails.build_markers(@schools_near) do |school, marker|
      marker.lat school.latitude
      marker.lng school.longitude
      marker.infowindow render_to_string(partial: "/pages/school_map_box", locals: { school: school })
    end
  end
end
