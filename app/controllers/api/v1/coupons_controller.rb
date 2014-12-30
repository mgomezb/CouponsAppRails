class Api::V1::CouponsController < Api::V1::ApplicationController

	def index

		coupons_list = []

		beacons_list = []

		notifications_list = []

		@local = Local.find(params[:local_id])

		@local.beacons.each do |beacon|
			beacon_data= {
				id: beacon.id,
				mayor: beacon.major,
				minor: beacon.minor,
				proximity_uuid: beacon.proximity_uuid,
				coupons_ids: beacon.coupons,
				notifications_ids: beacon.notifications
			}

			beacons_list << beacon_data
		end

		@local.stores.each do |store|
			store.coupons.each do |coupon|
				if coupon.end_date >= Time.new
					coupon_data = {
						id: coupon.id,
						title: coupon.title,
						message: coupon.message,
						init_date: coupon.init_date ,
						end_date: coupon.end_date,
						access_level: coupon.access_level,
						legal: coupon.legal,
						use_instructions: coupon.use_instructions,
						proximity_trigger_range: coupon.proximity_trigger_range,
						code: coupon.code,
						store_id: coupon.store_id,
						store_name: store.name,
						image_url: coupon.image.url,
						stock: coupon.stock,
						category: coupon.category
					}

					coupons_list << coupon_data
				end
			end
		end

		@local.notifications.each do |notification|
			notifications_list << notification
		end

		response = {"beacons" => beacons_list, "coupons" => coupons_list , "notifications" => notifications_list }
		render json: response
	end

	def claim_coupon
		@coupon_claim = Coupon.find(params[:id])

		if @coupon_claim
			if @coupon_claim.stock > 0

				@validate_coupon = current_user.user_coupons.build coupon_id: @coupon_claim.id

				if @validate_coupon.save
					@coupon_claim.stock = @coupon_claim.stock - 1
					@coupon_claim.save
					render status: 200, json: {status: 200, message: "Cupon canjeado exitosamente"}
				else
					render status: 200, json: {status: 406, message: "Cupon canjeado anteriormente"}
				end
			else
				render status: 200, json: {status: 402, message: "Cupon sin stock"}
			end
		else
			render status: 200, json: {status: 404, message: "Cupon no existe"}
		end
		#render json: @coupon_claim
		#respond_to do |format|
		#	format.json {@coupon_claim}
		#end
	end

end

#init_date: coupon.init_date.strftime('%d-%m-%Y') ,
#init_date: coupon.init_date.to_time.to_i ,