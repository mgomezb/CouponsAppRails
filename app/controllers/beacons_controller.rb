class BeaconsController < ApplicationController
  before_action :set_local
  before_action :set_beacon, only: [:show, :edit, :update, :destroy, :add_notification]

  # GET /beacons
  # GET /beacons.json
  def index
    @beacons = @local.beacons.order :id
    @beacon = @local.beacons.build
  end

  # GET /beacons/1
  # GET /beacons/1.json
  def show
    @stores = @local.stores
    @coupons = []

    @stores.each do |store|
      store.coupons.each do |coupon|
        if coupon.end_date >= Time.new
          @coupons << coupon
        end
      end
    end
    @coupons = @coupons - @beacon.coupons
  end

  def add_notification
    @notifications = []

    @local.notifications.each do |notification|
      if notification.end_date >= Time.new
          @notifications << notification
      end
    end
    @notifications = @notifications - @beacon.notifications
  end

  # GET /beacons/new
  def new
    @beacon = @local.beacons.build
  end

  # GET /beacons/1/edit
  def edit
  end

  # POST /beacons
  # POST /beacons.json
  def create
    @beacon = Beacon.new(beacon_params)
    @beacon.local =  @local

    respond_to do |format|
      if @beacon.save
        DateUpdate.new().save
        format.html { redirect_to local_beacons_path, notice: 'Beacon was successfully created.' }
        format.json { render :show, status: :created, location: @beacon }
      else
        format.html { render :new }
        format.json { render json: @beacon.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /beacons/1
  # PATCH/PUT /beacons/1.json
  def update
    respond_to do |format|
      if @beacon.update(beacon_params)
        DateUpdate.new().save
        format.html { redirect_to local_beacons_path, notice: 'Beacon was successfully updated.' }
        format.json { render :show, status: :ok, location: @beacon }
      else
        format.html { render :edit }
        format.json { render json: @beacon.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /beacons/1
  # DELETE /beacons/1.json
  def destroy
    @beacon.destroy
    DateUpdate.new().save
    respond_to do |format|
      format.html { redirect_to local_beacons_path, notice: 'Beacon was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def add_coupon_to_beacon
    id = params[:coupon]
    beacon = params[:beacon]


    if beacon and id
      coupon_beacon = Beacon.find(beacon).beacon_coupons.build coupon_id: id
      coupon_beacon.save
      DateUpdate.new().save
      render status: 200, json: {status: 200}
    else
      render status: 406, json: {status: 406}
    end
  end

  def remove_coupon_from_beacon
    id = params[:coupon]
    beacon = params[:beacon]


    if beacon and id
      coupon_beacon = BeaconCoupon.where({beacon_id: beacon, coupon_id: id}).first

      if coupon_beacon and coupon_beacon.destroy
        DateUpdate.new().save
        render status: 200, json: {status: 200}
      else
        render status: 406, json: {status: 406}
      end
    else
      render status: 406, json: {status: 406}
    end
  end

  def add_notification_to_beacon
    id = params[:notification]
    beacon = params[:beacon]


    if beacon and id
      notification_beacon = Beacon.find(beacon).beacon_notifications.build notification_id: id
      notification_beacon.save
      DateUpdate.new().save
      render status: 200, json: {status: 200}
    else
      render status: 406, json: {status: 406}
    end
  end

  def remove_notification_from_beacon
    id = params[:notification]
    beacon = params[:beacon]


    if beacon and id
      notification_beacon = BeaconNotification.where({beacon_id: beacon, notification_id: id}).first

      if notification_beacon and notification_beacon.destroy
        DateUpdate.new().save
        render status: 200, json: {status: 200}
      else
        render status: 406, json: {status: 406}
      end
    else
      render status: 406, json: {status: 406}
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_beacon
      @beacon = @local.beacons.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def beacon_params
      params.require(:beacon).permit(:major, :minor, :proximity_uuid, :description, :local_id)
    end

    def set_local
      @local = Local.find(params[:local_id])
    end
end
