class FlightsController < ApplicationController

    # before_action: load_flight

    def index
        @flights =Flight.all

    end

    def show
        @flights = Flight.find(params[:id])
    end

    def new
        @flights = Flight.new
    end

    def edit
        @flights = Flight.find(params[:id])
    end

    def create
        @flights = Flight.new(params.require(:flights).permit(:source, :destination, :price, :depart_date))
        
        if @flights.save
            redirect_to @flights
            flash[:notice] = "Flight was created successfully."
        else
            render 'new'
        end
    end

    def update
        
        @flight = Flight.find(params[:id])
        

        if @flight.update(params.require(:flight).permit(:source, :destination, :price, :depart_date))

            redirect_to @flight

        else
            render 'edit'
        end
    end

    def destroy
        

        @flight = Flight.find(params[:id])
        @flight.destroy
        redirect_to flights_path
    end

    # def load_flight
    #     byebug
    # end


end