class BagsController < ApplicationController
  before_action :set_bag, only: [:show, :edit, :update, :destroy]

  # GET /bags
  # GET /bags.json
  def index
    @bags = current_user.bags.all
  end

  # GET /bags/1
  # GET /bags/1.json
  def show
  end

  # GET /bags/new
  def new
    @bag = current_user.bags.new
  end

  # GET /bags/1/edit
  def edit
  end

  # POST /bags
  # POST /bags.json
  def create
    @bag = current_user.bags.new(bag_params)

    respond_to do |format|
      if @bag.save
        format.html { redirect_to @bag, notice: 'Bag was successfully created.' }
        format.json { render :show, status: :created, location: @bag }
        current_user.customer_bags.where(bag_id: @bag.id).first_or_create!
      else
        format.html { render :new }
        format.json { render json: @bag.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /bags/1
  # PATCH/PUT /bags/1.json
  def update
    respond_to do |format|
      if @bag.update(bag_params)
        format.html { redirect_to @bag, notice: 'Bag was successfully updated.' }
        format.json { render :show, status: :ok, location: @bag }
      else
        format.html { render :edit }
        format.json { render json: @bag.errors, status: :unprocessable_entity }
      end
      @bag.calculate_price
    end
  end

  # DELETE /bags/1
  # DELETE /bags/1.json
  def destroy
    @bag.destroy
    respond_to do |format|
      format.html { redirect_to bags_url, notice: 'Bag was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bag
      @bag = Bag.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def bag_params
      params.require(:bag).permit(:bag_type, :weight, :price)
    end
end
