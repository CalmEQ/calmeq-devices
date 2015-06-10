class ReadingsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    @readings = Reading.all
  end

  def show
    @reading = Reading.find(params[:id])
    @py = Py.find(@reading.identifier)
  end
  
  def create
    @py = Py.find_or_create_by(identifier: params[:identifier])
    @reading = @py.readings.create(reading_params)
    @reading.py_id = @py.id
    redirect_to py_reading_path(@py, @reading)
  end
 
  private
    def reading_params
      params.require(:reading).permit(:lat, :lon, :dblvl, :devicetime, :py_id, :identifier)
    end

end
