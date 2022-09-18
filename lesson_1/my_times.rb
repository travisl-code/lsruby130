def times(amount_of_times)
  counter = 0
  loop do
    yield counter
    counter += 1
    break if counter == amount_of_times
  end
  counter
end

times(5) do |num|
  puts num
end