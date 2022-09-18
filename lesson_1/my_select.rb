def select(collection)
  new_collection = []
  idx = 0

  while idx < collection.size
    item = collection[idx]
    result = yield item
    new_collection << item if !!result
    idx += 1
  end

  new_collection
end

array = [1, 2, 3, 4, 5]

p select(array) { |num| num.odd? }      # => [1, 3, 5]
p select(array) { |num| puts num }      # => [], because "puts num" returns nil and evaluates to false
p select(array) { |num| num + 1 }       # => [1, 2, 3, 4, 5], because "num + 1" evaluates to true