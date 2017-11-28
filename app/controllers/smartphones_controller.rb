class SmartphonesController < ApplicationController
  include SessionHelper

  before_action :set_smartphone, only: %i[show edit update destroy]
  before_action :authenticate_user!, only: %i[edit update destroy create new]
  before_action :validate_admin, only: %i[edit update destroy create new]
  skip_before_action :verify_authenticity_token, only: %i[get_smartphones]
  # GET /smartphones
  # GET /smartphones.json
  def index
    @smartphones = Smartphone.all
  end

  # GET /smartphones/1
  # GET /smartphones/1.json
  def show
    @numbers = {
      1 => 'one',
      2 => 'two',
      3 => 'three',
      4 => 'four',
      5 => 'five',
      6 => 'six',
      7 => 'seven',
      8 => 'eight',
      9 => 'nine',
      10 => 'ten'
    }

    @relateds = Smartphone.order("ABS(price - CAST('?' AS SIGNED)) ASC", @smartphone.price.to_s)
                          .where('id != ?', @smartphone.id).first(4)
  end

  # GET /smartphones/new
  def new
    @smartphone = Smartphone.new
  end

  # GET /smartphones/1/edit
  def edit; end

  # POST /smartphones
  # POST /smartphones.json
  def create
    @smartphone = Smartphone.new(smartphone_params)

    respond_to do |format|
      if @smartphone.save
        if params[:images]
          params[:images].each do |val|
            @smartphone.pictures.create(image: val)
          end
        end

        format.html { redirect_to @smartphone, notice: 'Smartphone was successfully created.' }
        format.json { render :show, status: :created, location: @smartphone }
      else
        format.html { render :new }
        format.json { render json: @smartphone.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /smartphones/1
  # PATCH/PUT /smartphones/1.json
  def update
    respond_to do |format|
      if @smartphone.update(smartphone_params)
        if params[:images]
          params[:images].each do |val|
            if @smartphone.pictures.find_by(image_file_name: val.original_filename)
              @smartphone.pictures.update(image: val)
            else
              @smartphone.pictures.create(image: val)
            end
          end
      end
        format.html { redirect_to @smartphone, notice: 'Smartphone was successfully updated.' }
        format.json { render :show, status: :ok, location: @smartphone }
      else
        format.html { render :edit }
        format.json { render json: @smartphone.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /smartphones/1
  # DELETE /smartphones/1.json
  def destroy
    @smartphone.destroy
    respond_to do |format|
      format.html { redirect_to smartphones_url, notice: 'Smartphone was successfully destroyed.' }
      format.json { head :no_content }
    end
  end


  # POST /get-smartphones/list
  # POST /get-smartphones/list.json
  def get_smartphones
    # list = JSON.parse(params[:listSmartphones])
    list = params[:listSmartphones]
    smartphones = []
    list.each{|id, count|
      temp = Smartphone.find(id)      
      item = {id: temp.id, name: temp.name, price: temp.price, quantity: count}  
      smartphones << item
    }

    respond_to do |format|
        format.json { render json:smartphones}
    end
  end

  # GET /catalogo
  # GET /catalogo.json
  def catalogo
    if params[:search] && params[:search] != ''
      @smartphones = Smartphone.where('name REGEXP ?', params[:search])
    else
      @smartphones = Smartphone.all
    end
  end

  def home
    @smartphones = Smartphone.all.limit(4)
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_smartphone
    @smartphone = Smartphone.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def smartphone_params
    params.require(:smartphone).permit(:name, :price, :description, :sim, :ram, :colors, :storage, :os, :screen, :promo, :images, :listSmartphones)
  end
end
