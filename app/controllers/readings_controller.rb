class ReadingsController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :set_reading, only: [:show, :edit, :update, :destroy]

  def index
    @readings = Reading.all
  end

  def show
    #@reading = Reading.find(params[:id])
    @py = Py.find(@reading.py_id)
  end
  
  def create
    @py = Py.find(params[:py_id])
    @newreading = @py.readings.create(reading_params)
    @newreading.py_id = @py.id
    
    respond_to do |format|
      format.html {redirect_to py_reading_path(@py, @newreading)}
      format.xml {render xml: @newreading}
      format.json {render json: @newreading}
    end

  end

  # PATCH/PUT /readings/1
  # PATCH/PUT /readings/1.json
  def update
    respond_to do |format|
      if @reading.update(reading_params)
        format.html { redirect_to @reading, notice: 'Reading was successfully updated.' }
        format.json { render json: @reading }
      else
        format.html { render :edit }
        format.json { render json: @reading.errors, status: :unprocessable_entity }
      end
    end
  end
  
  # GET /readings/1/edit
  def edit
  end

  # DELETE /readings/1
  # DELETE /readings/1.json
  def destroy
    @reading.destroy
    respond_to do |format|
      format.html { redirect_to pies_path, notice: 'Reading was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

 
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_reading
      @reading = Reading.find(params[:id])
    end
  
    def reading_params
      params.require(:reading).permit(:lat, :lon, :dblvl, :devicetime, :py_id, :identifier)
    end

end
