class BookingsController < ApplicationController
  def new
    @booking = Booking.new
    @flight = Flight.find(params[:selected_flight_id])
    @number_of_passengers = params[:passengers]
  end
end
