class TadpolesController < ApplicationController
  before_action :set_tadpole, only: [:show, :edit, :update, :destroy]

  def index
    @tadpoles = Tadpole.all
  end

  def new
    @frog = Frog.find(params[:id])
    @tadpole = Tadpole.new
  end

  def create
    @tadpole = Tadpole.new(tadpole_params)
    respond_to do |format|
      if @tadpole.save
        format.html { redirect_to @tadpole, notice: 'Tadpole was successfully created.' }
        format.json { render :show, status: :created, location: @tadpole }
      else
        format.html { render :new }
        format.json { render json: @tadpole.errors, status: :unprocessable_entity }
      end
    end
  end

  def show
    @tadpole = Tadpole.find(params[:id])
  end

  def edit
  end

  def update
    respond_to do |format|
      if @tadpole.update(tadpole_params)
        format.html { redirect_to @tadpole, notice: 'Tadpole was successfully updated.' }
        format.json { render :show, status: :ok, location: @tadpole }
      else
        format.html { render :edit }
        format.json { render json: @tadpole.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @tadpole.destroy
    respond_to do |format|
      format.html { redirect_to tadpoles_url, notice: 'Tadpole was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def evolve
    tadpole = Tadpole.find(params[:id])
    tadpole.evolve
    redirect_to tadpoles_url
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tadpole
      @tadpole = Tadpole.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tadpole_params
      params.require(:tadpole).permit(:name, :color, :frog_id)
    end

end