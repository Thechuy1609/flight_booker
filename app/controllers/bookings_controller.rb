class BookingsController < ApplicationController
  def new
    @booking = Booking.new
    @flight = Flight.find(params[:selected_flight_id])
    @number_of_passengers = params[:passengers]
  end

  def create
    @booking = Booking.new(booking_params)
    @flight = Flight.find_by(id: params[:booking][:flight_id])
    if @booking.save
        redirect_to booking_path(@booking), notice: "Booking confirmed!"
    else
      render :new, status: :unprocessable_entity
    end
  end
  def show
    @booking = Booking.find(params[:id])
    @flight = @booking.flight
    @passengers = @booking.passengers
  end
  def index
    @bookings = Booking.all
  end

  private

  def booking_params
      params.require(:booking).permit(:flight_id, :passengers)
  end
end
