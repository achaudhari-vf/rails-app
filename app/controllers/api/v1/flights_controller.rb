# app/controllers/api/v1/flights_controller.rb

module Api
    module V1
      class FlightsController < ApplicationController
        before_action :authenticate_user!
        
        # before_action :load_flight, only: [:show, :update, :destroy]
        
  
        def index
          @flights = Flight.includes(:user).all
          render json: @flights
        end
  
        def show
          @flight = Flight.find(params[:id])
          if @flight
            render json: @flight
          else
            render json: { error: 'Flight not found' }, status: :not_found
          end
        end
  
        def create
          @flight = Flight.new(flight_params)
          @flight.user = User.first
          if @flight.save
            render json: @flight, status: :created
          else
            render json: @flight.errors, status: :unprocessable_entity
          end
        end
  
        def update
          @flight = Flight.find(params[:id])
          if @flight.update(flight_params)
            render json: @flight
          else
            render json: @flight.errors, status: :unprocessable_entity
          end
        end
  
        def destroy
          @flight = Flight.find(params[:id])
          if @flight
            @flight.destroy
            head :no_content
          else
            render json: { error: 'Flight not found' }, status: :not_found
          end
        end
  
        private
  
        def flight_params
          params.require(:flight).permit(:source, :destination, :price, :depart_date)
        end
        
  
       
      end
    end
  end
  