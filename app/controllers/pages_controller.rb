class PagesController < ApplicationController
  def home
    @airplanes = Airplane.all
  end
end
