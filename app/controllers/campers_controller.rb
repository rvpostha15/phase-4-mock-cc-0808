class CampersController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :render_camper_not_found_response

    def index 
        campers = Camper.all
        render json: campers, status: :ok
    end

    def show 
        camper = find_camper
        render json: camper, serializer: CamperActivitiesSerializer, status: :ok
    end

    def create 
        camper = Camper.create!(camper_params)
        render json: camper, status: :created
    end

    private 

    def find_camper 
        Camper.find(params[:id])
    end

    def camper_params 
        params.permit(:name, :age)
    end

    def render_camper_not_found_response(exception)
        render json: { error: "Camper not found" }, status: :not_found
    end
end
