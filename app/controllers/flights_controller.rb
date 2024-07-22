class FlightsController < ApplicationController

    # before_action: load_flight

    def index
        @flights = Flight.includes(:user).all

    end

    def show
        @flight = Flight.find(params[:id])
    end

    def new
        @flight = Flight.new
    end

    def edit
        @flight = Flight.find(params[:id])
    end

    def create
        @flight = Flight.new(params.require(:flights).permit(:source, :destination, :price, :depart_date))
        @flight.user = User.first # <--- Add this line

        
        if @flight.save
            redirect_to @flight
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