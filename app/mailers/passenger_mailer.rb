class PassengerMailer < ApplicationMailer
    def confirm
        @passenger = params[:passenger]
        @booking = params[:booking]
        @url = 'http://localhost:3000/confirm'
        mail(to: @passenger.email, subject: 'Booking Confirmation')
    end
end
