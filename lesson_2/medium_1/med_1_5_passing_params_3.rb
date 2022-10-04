=begin
Given the `items` and the `gather` method define, complete calls to `gather` to produce the correct outputs.
=end

items = ['apples', 'corn', 'cabbage', 'wheat']

def gather(items)
  puts "Let's start gathering food."
  yield(items)
  puts "We've finished gathering!"
end

# 1)
gather(items) do | *food, last_item|
  puts food.join(', ')
  puts last_item
end

# ... should ouput:
# Let's start gathering food.
# apples, corn, cabbage
# wheat
# We've finished gathering!

# 2)
gather(items) do | item_1, *food, last_item|
  puts item_1
  puts  food.join(', ')
  puts last_item
end

# ... should output:
# Let's start gathering food.
# apples
# corn, cabbage
# wheat
# We've finished gathering!

# 3)
gather(items) do | first, *args|
  puts first
  puts args.join(', ')
end

# ... should output:
# Let's start gathering food.
# apples
# corn, cabbage, wheat
# We've finished gathering!

# 4)
gather(items) do | arg1, arg2, arg3, arg4|
  puts "#{arg1}, #{arg2}, #{arg3}, and #{arg4}"
end

# ... should output:
# Let's start gathering food.
# apples, corn, cabbage, and wheat
# We've finished gathering!
