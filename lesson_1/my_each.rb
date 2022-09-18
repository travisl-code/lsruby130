def each(collection)
  idx = 0

  while idx < collection.size
    yield collection[idx]
    idx += 1
  end

  collection
end

arr = [1, 2, 3]
each(arr) { |element| puts element }
