class ReadingsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    @readings = Reading.all
  end

  def show
    @reading = Reading.find(params[:id])
    @py = Py.find(@reading.py_id)
  end
  
  def create
    @py = Py.find(params[:py_id])
    @newreading = @py.readings.create(reading_params)
    redirect_to py_reading_path(@py, @newreading)
  end
 
  private
    def reading_params
      params.require(:reading).permit(:lat, :lon, :dblvl, :devicetime, :py_id)
    end

end
