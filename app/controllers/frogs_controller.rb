class FrogsController < ApplicationController

  before_action :set_frog, only: [:show, :edit, :update, :destroy]

  def index
    @frogs = Frog.all
  end

  def create
    @frog = Frog.new(frog_params)
    respond_to do |format|
      if @frog.save
        format.html { redirect_to @frog, notice: 'Movie was successfully created.' }
        format.json { render :show, status: :created, location: @frog }
      else
        format.html { render :new }
        format.json { render json: @frog.errors, status: :unprocessable_entity }
      end
    end
  end

  def new
    @frog = Frog.new
    @ponds = Pond.all
  end

  def show
  end

  def edit
    @ponds = Pond.all
  end

  def update
    @frog = Frog.find(params[:id])
    respond_to do |format|
      if @frog.update(frog_params)
        format.html { redirect_to @frog, notice: 'Frog was successfully updated.' }
        format.json { render :show, status: :ok, location: @frog }
      else
        format.html { render :edit }
        format.json { render json: @frog.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @frog.destroy
    respond_to do |format|
      format.html { redirect_to frogs_url, notice: 'Frog was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_frog
      @frog = Frog.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def frog_params
      params.require(:frog).permit(:name, :color, :pond_id)
    end
    
end