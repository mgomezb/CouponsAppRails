class Api::V1::CouponsController < Api::V1::ApplicationController

	def index

		coupons_list = []

		beacons_list = []
		@local = Local.find(params[:local_id])

		@local.stores.each do |store|
			store.coupons.each do |coupon|
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
					image_url: coupon.image.url
				}

				coupons_list << coupon_data
			end
		end

		@local.beacons.each do |beacon|
			beacons_list << beacon
		end

		response = { "coupons" => coupons_list , "beacons" => beacons_list }
		render json: response
	end
end

#init_date: coupon.init_date.strftime('%d-%m-%Y') ,
#init_date: coupon.init_date.to_time.to_i ,