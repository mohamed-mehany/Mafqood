class MissingsController < ApplicationController
  def index
    @missing = Missing.new
    render 'new'
  end
  def show
    @missing = Missing.find(params[:id])
  end

  def new
    @missing = Missing.new
  end

  def create
    @missing = Missing.new(params[:missing].permit(:age, :location, :reporter_name, :reporter_phone, :description, :image, :gender, :special_signs))
    # @missing = Missing.create(params.require(:missing).permit(:approximate_age, :location, :reporter_name, :reporter_phone, :description, :image, :gender, :special_signs))

    if @missing.save
      flash[:notice] = "Your Post has been created successfully"
      redirect_to @missing
    else
      render 'new'
    end
  end

  protected

  def missing_params
    params.require(:missing).permit(:approximate_age, :location, :reporter_name, :reporter_phone, :description, :image, :gender, :special_signs)
  end


end
