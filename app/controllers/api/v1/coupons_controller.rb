class Api::V1::CouponsController < Api::V1::ApplicationController

	def index

		coupons_list = []

		beacons_list = []
		@local = Local.find(params[:local_id])

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
						proximity_trigger_range: coupon.proximity_trigger_range,
						code: coupon.code,
						store_id: coupon.store_id,
						store_name: store.name,
						image_url: coupon.image.url,
						stock: coupon.stock
					}

					coupons_list << coupon_data
				end
			end
		end

		@local.beacons.each do |beacon|
			beacons_list << beacon
		end

		response = { "coupons" => coupons_list , "beacons" => beacons_list }
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
					render status: 200, json: {message: "Cupon canjeado exitosamente"}
				else
					render status: 406, json: {message: "Cupon canjeado anteriormente"}
				end
			else
				render status: 200, json: {message: "Cupon sin stock"}
			end
		else
			render status: 404, json: {message: "Cupon no existe"}
		end
		#render json: @coupon_claim
		#respond_to do |format|
		#	format.json {@coupon_claim}
		#end
	end

end

#init_date: coupon.init_date.strftime('%d-%m-%Y') ,
#init_date: coupon.init_date.to_time.to_i ,