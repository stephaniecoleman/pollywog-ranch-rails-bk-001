class PondsController < ApplicationController
  before_action :set_pond, only: [:show, :edit, :update, :destroy]

  def index
    @ponds = Pond.all
  end

  def create
    @pond = Pond.new(pond_params)
    respond_to do |format|
      if @pond.save
        format.html { redirect_to @pond, notice: 'Pond was successfully created.' }
        format.json { render :show, status: :created, location: @pond }
      else
        format.html { render :new }
        format.json { render json: @pond.errors, status: :unprocessable_entity }
      end
    end
  end

  def new
    @pond = Pond.new
  end

  def show
  end

  def edit
  end

  def update
    @pond = Pond.find(params[:id])
    respond_to do |format|
      if @pond.update(pond_params)
        format.html { redirect_to @pond, notice: 'Pond was successfully created.' }
        format.json { render :show, status: :created, location: @pond }
      else
        format.html { render :new }
        format.json { render json: @pond.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @pond.destroy
    respond_to do |format|
      format.html { redirect_to ponds_url, notice: 'Pond was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pond
      @pond = Pond.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def pond_params
      params.require(:pond).permit(:name, :water_type)
    end

end