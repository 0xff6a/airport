require_relative 'plane'
require_relative 'airport'

plane = Plane.new
airport1 = Airport.new
airport2  = Airport.new
airport3 = Airport.new

puts "Departure airport #{airport1.name}"

while airport1.empty? do
	airport1.request_landing(plane)
end

puts airport1.inspect
puts "Request for take off"

until airport1.empty? do
	airport1.request_take_off(plane)
	puts "cannot take off due to stormy weather, try again!" if !airport1.empty?
end

print "Plane:"
puts plane.inspect
puts "Arrival airport #{airport2.name}"
airport2.capacity.times { airport2.request_landing(Plane.new) }
airport2.capacity.times { airport2.request_landing(Plane.new) }
puts "#{plane.id} request to land..."
airport2.request_landing(plane)
puts airport2.inspect
puts "Ruh roh full! rerouting to #{airport3.name}"

while airport3.empty? do
	puts "#{plane.id} request to land"
	airport3.request_landing(plane)
	puts "cannot land due to stormy weather, try again!" if airport3.empty?
	puts airport3.inspect
end

puts "Landed"
print "Airport:"
puts airport3.inspect
print "Plane:"
puts plane.inspect

