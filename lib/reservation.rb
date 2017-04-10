class Reservation
    attr_accessor :title, :numpeople, :date, :phone, :id
    
    def initialize(title = "title", numpeople = "Anonymous", date = "Date", phone = "phone")
        self.title = title
        self.numpeople = numpeople
        self.date = date
        self.phone = phone
    end
    
    def print_reservation_info
        puts  "reserved seats for #{@numpeople}on #{@date} with phone number #{@phone}"
    end
end 
