#coversation yielding

def conversation
  puts "Hello"
  yield
  puts "Goodbye"
end

def five_times(times)
  1.upto(times) do |count|
    yield count
  end
end

# conversation {puts "Good to meet you!"}

five_times(7) do |n|
  puts "#{n} situps"
  puts "#{n} pushups"
  puts "#{n} chinups"
end
