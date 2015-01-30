class CouponsController < ApplicationController
  before_action :set_local
  before_action :set_store
  before_action :set_coupon, only: [:show, :edit, :update, :destroy]

  # GET /coupons
  # GET /coupons.json
  def index
    @coupons = @store.coupons.order :id
    @coupon = @store.coupons.build
  end

  # GET /coupons/1
  # GET /coupons/1.json
  def show
  end

  # GET /coupons/new
  def new
    @categories = Category.all.order :name
    @coupon = @store.coupons.build
  end

  # GET /coupons/1/edit
  def edit
    @categories = Category.all.order :name
  end

  # POST /coupons
  # POST /coupons.json
  def create

    #puts coupon_params.inspect

    @coupon = Coupon.new(coupon_params)
    @coupon.store_id = @store.id
    respond_to do |format|
      if @coupon.valid?
        @coupon.save
        #DateUpdate.new().save
        format.html { redirect_to local_store_path(@local, @store) , notice: 'Coupon was successfully created.' }
        format.json { render :show, status: :created, location: @coupon }
      else
        format.html { render :new }
        format.json { render json: @coupon.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /coupons/1
  # PATCH/PUT /coupons/1.json
  def update
    respond_to do |format|
      if @coupon.update(coupon_params)
        #DateUpdate.new().save
        format.html { redirect_to local_store_path(@local, @store), notice: 'Coupon was successfully updated.' }
        format.json { render :show, status: :ok, location: @coupon }
      else
        format.html { render :edit }
        format.json { render json: @coupon.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /coupons/1
  # DELETE /coupons/1.json
  def destroy
    @coupon.destroy
    #DateUpdate.new().save
    respond_to do |format|
      format.html { redirect_to local_store_path(@local, @store), notice: 'Coupon was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_coupon
      @coupon = @store.coupons.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def coupon_params
      params.require(:coupon).permit(:title, :message, :init_date, :end_date, :access_level, :legal, :proximity_trigger_range, :image, :code, :store_id, :stock, :category, :use_instructions)
    end

    def set_store
      @store = Store.find(params[:store_id])
    end

    def set_local
      @local = Local.find(params[:local_id])
    end
end
