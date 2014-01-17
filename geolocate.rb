require 'open-uri'
require 'json'

print "Enter an address, city or zipcode: "
address = gets
address = address.chomp.gsub(" ","+")

json_data = open("http://maps.googleapis.com/maps/api/geocode/json?address=#{address}&sensor=false").read()
data = JSON.parse(json_data)

latitude = data["results"][0]["geometry"]["location"]["lat"]
longitude = data["results"][0]["geometry"]["location"]["lng"]

puts "Latitude: #{latitude}"
puts "Longitude: #{longitude}"