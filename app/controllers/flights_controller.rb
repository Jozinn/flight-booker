class FlightsController < ApplicationController
    def index
        @flights = Flight.where(departure_id: flight_params[:departure_id], arrival_id: flight_params[:arrival_id], start: flight_params[:start], empty_seats: flight_params[:empty_seats])
        @flight = Flight.new
    end

    private
    def flight_params
        params.reguire(:flight).permit(:departure_id, :arrival_id, :start, :empty_seats)
    end
end
