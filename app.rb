require 'sinatra'
require 'reservation'
require 'reservation_store'

store = ReservationStore.new('yaml/store.yml')

get '/' do
     @reservations = store.all
     erb :index
end

get ('/reservations/new') do
     erb :new
end

post ('/create') do
     @reservation = Reservation.new
     @reservation.title = params['title']
     @reservation.numpeople = params['numpeople']
     @reservation.date = params['date']
     @reservation.phone = params['phone']
     
     store.save(@reservation)
     redirect '/reservation/views/new'
end