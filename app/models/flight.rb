class Flight < ApplicationRecord
 belongs_to :departure_airport, class_name: 'Airport'
  belongs_to :arrival_airport, class_name: 'Airport'
  has_many :bookings
  has_many :passengers , through: :bookings
  def self.search(params)
      flights = Flight.joins(:departure_airport, :arrival_airport)
                      .where("airports.code LIKE ? OR airports.code LIKE ? OR date_time LIKE ?", "%#{params[:departure_airport_id]}%", "%#{params[:arrival_airport_id]}%", "%#{params[:date_time]}%")
    flights
  end
  def date_time_formatted
    date_time.strftime("%m/%d/%Y")
  end
end
