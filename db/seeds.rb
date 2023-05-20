require 'csv'
file = CSV.parse(File.read("covid_19_data.csv"), headers: true)
puts "Seed Covid 19 CSV Data File"
file.each_with_index do |f, index|
  print "Seeding line #{index} out of #{file.count}\r"
  CovidObservation.create(observation_date: Date.strptime(f["ObservationDate"], '%m/%d/%Y'), province: f["Province/State"], country: f["Country/Region"], confirmed: f["Confirmed"], deaths: f["Deaths"], recovered: f["Recovered"])
end
