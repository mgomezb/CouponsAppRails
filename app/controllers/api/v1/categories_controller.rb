class Api::V1::CategoriesController < Api::V1::ApplicationController

	def index
		response = { "categories" => (Category.all.order :name) }
		render json: response
	end
end
