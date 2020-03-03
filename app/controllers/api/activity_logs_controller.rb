class Api::ActivityLogsController < ApplicationController
	
	def index
		baby_id = params[:baby_id]
		baby = Baby.find baby_id
		unless baby.blank?
			#activity_logs = baby.activity_logs
			#data = activity_logs.map { |e| {id: e.id, assistan: Assistant.find(e.assistant_id).name } }
			
			data = ActivityLog.joins(:assistant)
					.where("baby_id=?",baby_id)
					.select("activity_logs.id, 
							activity_logs.baby_id, 
							assistants.name as assistant_name, 
							activity_logs.start_time, 
							activity_logs.stop_time")
			
			render json: { status: 200, message: 'Loaded activity logs', data: data}
		else
			render json: { status: 404, message: 'ID not found'}
		end
	end

	def create
		baby_id = params[:baby_id]	
		assistant_id = params[:assistant_id]
		activity_id = params[:activity_id]
		start_time = params[:start_time]

		asignacion = ActivityLog.new(
			baby_id: baby_id,
			assistant_id: assistant_id,
			activity_id: activity_id,
			start_time: start_time
		)

	
	    if asignacion.save
	    	render json: { status: 201, message: 'Created activity log', data: asignacion}
	    else
			render json: { status: 500, message: 'Error in save data'}
	    end

	end

end