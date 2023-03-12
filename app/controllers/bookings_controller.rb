class BookingsController < ApplicationController
    def new
        @booking = Booking.new
        @flight = Flight.find(params[:flight])
        @seats_number = params[:passengers_number]
        @passenger = Passenger.new
    end

    def create
        @booking = Booking.new(booking_params)
        @passenger = Passenger.new(passenger_params)
        @booking.passenger = @passenger
        if @booking.save
            flight = Flight.find(params[:booking][:flight])
            flight.update(empty_seats: (flight.empty_seats - 1))
            PassengerMailer.with(passenger: @passenger, booking: @booking).confirm.deliver_now!
            redirect_to @booking
        else
            render :new, status: :unprocessable_entity
        end
    end

    def show
        @booking = Booking.find(params[:id])
        @passenger = @booking.passenger
    end

    private
    def booking_params
        params.require(:booking).permit!
    end

    def passenger_params
        params.require(:passenger).permit!
    end
end
