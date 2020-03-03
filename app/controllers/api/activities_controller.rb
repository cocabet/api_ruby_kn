class Api::ActivitiesController < ApplicationController
	def index
		activities = Activity.order('created_at DESC')
		render json: { status: 'SUCCESS', message: 'Loaded activities', data: activities}
	end
end