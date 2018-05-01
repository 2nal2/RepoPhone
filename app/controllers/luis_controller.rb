class LuisController < ApplicationController
  before_action :set_lui, only: [:show, :edit, :update, :destroy]

  # GET /luis
  # GET /luis.json
  def index
    @luis = Lui.all
  end

  # GET /luis/1
  # GET /luis/1.json
  def show
  end

  # GET /luis/new
  def new
    @lui = Lui.new
  end

  # GET /luis/1/edit
  def edit
  end

  # POST /luis
  # POST /luis.json
  def create
    @lui = Lui.new(lui_params)

    respond_to do |format|
      if @lui.save
        format.html { redirect_to @lui, notice: 'Lui was successfully created.' }
        format.json { render :show, status: :created, location: @lui }
      else
        format.html { render :new }
        format.json { render json: @lui.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /luis/1
  # PATCH/PUT /luis/1.json
  def update
    respond_to do |format|
      if @lui.update(lui_params)
        format.html { redirect_to @lui, notice: 'Lui was successfully updated.' }
        format.json { render :show, status: :ok, location: @lui }
      else
        format.html { render :edit }
        format.json { render json: @lui.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /luis/1
  # DELETE /luis/1.json
  def destroy
    @lui.destroy
    respond_to do |format|
      format.html { redirect_to luis_url, notice: 'Lui was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_lui
      @lui = Lui.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def lui_params
      params.require(:lui).permit(:description)
    end
end
