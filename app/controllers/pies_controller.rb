class PiesController < ApplicationController
  # this should be replaced with a proper token system for each device soon.
  # something like 

  skip_before_action :verify_authenticity_token
#  skip_before_filter :verify_authenticity_token  

  def index
    @pies = Py.all
  end

  def show
    @py = Py.find(params[:id])
  end

  def new 
    @py = Py.new
  end
  
  def edit
    @py = Py.find(params[:id])
  end

  def create
    
    # initialize_by doesn't save new record.  That is what we need because it gives
    # us a chance to update fields other than identifier before saving it
    # if @py.new_record?  can be used to determine if new record was created or not
    @py = Py.find_or_initialize_by(identifier: py_params[:identifier])
    @py.update(py_params)
   
    respond_to do |format|
      format.html {redirect_to @py}
      format.xml {render xml: @py}
      format.json {render json: @py}
    end

  end
   
  def update
    @py = Py.find(params[:id])
   
    if @py.update(py_params)
      redirect_to @py
    #else - not used because we have no validation on the fields
    #  render 'edit'
    end
  end
    
  def destroy
    @py = Py.find(params[:id])
    @py.destroy
 
    redirect_to pies_path
  end
  
  private
    def py_params
      params.require(:py).permit(:identifier, :notes, :dblvl, :lat, :lon, :devicetime)
    end

end

