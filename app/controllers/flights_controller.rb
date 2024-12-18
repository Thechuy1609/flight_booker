class FlightsController < ApplicationController
  def new
    @flight = Flight.new
  end
  def index
    @flights = Flight.all
    @flight_options_dep = Flight.all.map{ |u| [u.departure_airport.code ] }
    @flight_options_arr = Flight.all.map{ |u| [u.arrival_airport.code] }
    @flight_options_date = Flight.all.map{ |u| [u.date_time] }
    @number_of_passengers = [ 1, 2,3, 4 ]
  end
  def search
    @flights = Flight.search(params)
    @number_of_passengers = params[:passengers]
  end
end
