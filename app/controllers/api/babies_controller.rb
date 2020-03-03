class Api::BabiesController < ApplicationController
	def index
		babies = Baby.order('created_at DESC')
		render json: { status: 'SUCCESS', message: 'Loaded babies', data: babies}
	end
end