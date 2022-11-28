class AirplanesController < ApplicationController
  def index
    @airplanes = Airplane.all
  end
end
