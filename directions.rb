require 'open-uri'
require 'json'

print "Enter an origin address: "
origin_address = gets
origin_address = origin_address.chomp.gsub(" ","+")

print "Enter a destination address: "
destination_address = gets
destination_address = destination_address.chomp.gsub(" ","+")

json_data = open("http://maps.googleapis.com/maps/api/directions/json?origin=#{origin_address}&destination=#{destination_address}&sensor=false").read()
data = JSON.parse(json_data)

drive_time = data["routes"][0]["legs"][0]["duration"]["text"]
drive_dist = data["routes"][0]["legs"][0]["distance"]["text"]

puts "Total travel time driving: #{drive_time}"
puts "Total distance traveled: #{drive_dist}"

