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
    @py = Py.new(py_params)
  
    if @py.save
      redirect_to @py
    else
      render 'new'
    end
  end
   
  def update
    @py = Py.find(params[:id])
   
    if @py.update(py_params)
      redirect_to @py
    else
      render 'edit'
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

