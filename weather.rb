require 'open-uri'
require 'json'

print "Please enter an address: "
address = gets
address = address.chomp.gsub(" ","+")

json_geo = open("http://maps.googleapis.com/maps/api/geocode/json?address=#{address}&sensor=false").read()
data_geo = JSON.parse(json_geo)

latitude = data_geo["results"][0]["geometry"]["location"]["lat"]
longitude = data_geo["results"][0]["geometry"]["location"]["lng"]

json_weather = open("http://api.openweathermap.org/data/2.5/weather?lat=#{latitude.round(2)}&lon=#{longitude.round(2)}").read()
data_weather = JSON.parse(json_weather)

temp = (9.0/5.0)*(data_weather["main"]["temp"]-273.15) + 32.0

puts "Current Temperature: #{temp.round(1)}f"