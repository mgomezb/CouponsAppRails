class Api::V1::CouponsController < Api::V1::ApplicationController

	def index
		@locals = Local.all
		render json: @locals
	end
end
