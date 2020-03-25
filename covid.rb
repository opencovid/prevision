deaths = 1
rest = 0
infected = deaths * 50
r0 = 2.7
population = 7_500_000_000
day = 1

# Optimistic (based on diamond | total 5000 | infected 712 | deaths 10)
max_infected = (0.14*population).round

# Prevision
# max_infected = ((1-(1/r0))*population).round

loop do
  sleep 1
  return if infected > max_infected 

  additional_deaths = deaths * 0.15
  
  if rest >= 1
    deaths += 1
    rest -= 1
  end 

  new_deaths = additional_deaths.floor
  rest += additional_deaths - new_deaths
  deaths += new_deaths

  infected = deaths * 50

  puts "Jour #{day} | Infecté #{infected} | Morts #{deaths}"
  day += 1
end

