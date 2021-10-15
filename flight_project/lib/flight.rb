require_relative "passenger"

class Flight

    attr_accessor :passengers

    def initialize(flight_number, capacity)
        @flight_number = flight_number
        @capacity = capacity
        @passengers = []
    end

    def full?
        @passengers.length >= @capacity
    end

    def board_passenger(pass)
        @passengers << pass if !self.full? && pass.has_flight?(@flight_number)
    end

    def list_passengers
        name_arr = []
        @passengers.each { |pass| name_arr << pass.name }
        name_arr
    end

    def [](index)
        @passengers[index]
    end

    def <<(pass)
        board_passenger(pass)
    end

end