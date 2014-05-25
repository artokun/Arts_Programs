# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

name1 = 'larry'
health1 = 30
name2 = 'curly'
health2 = 60
name3 = 'moe'
health3 = 100
name4 = 'shemp'
health4 = 90
current_time = Time.now
formatted_time = current_time.strftime('%A %m/%d/%Y at %I:%M%p')

puts "#{name1.capitalize}'s health is #{health1}"
puts "#{name2.upcase}'s health is #{health2}"
puts "#{name3.capitalize}'s health is #{health3}".center(40, '*')
puts "#{name4.capitalize.ljust(30,'.')} #{health4} health"
puts "\nPlayers: \n\t#{name1}\n\t#{name2}\n\t#{name3}\n\t#{name4}"
puts "\nThe game started on #{formatted_time}"