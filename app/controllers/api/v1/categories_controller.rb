class Api::V1::CategoriesController < ApplicationController

	def index
		response = { "categories" => (Category.all.order :name) }
		render json: response
	end
end
