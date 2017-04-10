require 'yaml/store'

class ReservationStore
    def initialize(filename)
        @store = YAML::Store.new(filename)
    end
    
    def save(reservation)
        @store.transaction do
            unless reservation.id
                highest_id = @store.roots.max || 0
                reservation.id = highest_id + 1
            end
            @store[reservation.id] = reservation
        end
    end
    def all 
        @store.transaction do
            @store.roots.map {|id| @store[id]}
        end
    end
end