class SignupsController < ApplicationController

    def index 
        signups = Signup.all
        render json: signups, status: :ok
    end

    def show 
        signup = Signup.find(params[:id])
        render json: signup, status: :ok
    end

    def create 
        signup = Signup.create!(params.permit(:time, :camper_id, :activity_id))
        render json: signup.activity, status: :created
    end

end
