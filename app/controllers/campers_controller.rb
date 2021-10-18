class CampersController < ApplicationController

    def index
        render json: Camper.all, status: :ok
    end

    def show 
        camper = Camper.find(params[:id])
        if camper
            render json: camper, serializer: CamperWithActivitiesSerializer

        else
            render json: camper.errors, status: :not_found
        end
    end

    def create
        camper = Camper.new(camper_params)
        if camper.save
            render json: camper, status: :created
        else
            render json: "validation errors", status: :unprocessable_entity
        end
    end

    private

    def camper_params
        params.permit(:name, :age)
    end


end
