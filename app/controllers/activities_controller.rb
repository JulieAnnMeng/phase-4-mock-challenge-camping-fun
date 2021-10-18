class ActivitiesController < ApplicationController

    def index 
        render json: Activity.all, status: :ok
    end

    def destroy 
        begin 
            activity = Activity.find(params[:id])
        rescue ActiveRecord::RecordNotFound
            render json: {error: "Activity not found"}
        else
            activity.destroy
            render json: activity, status: :no_content
        end
    end
end
