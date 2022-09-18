
# This class represents a collection of Todo objects.
# You can perform typical collection-oriented actions
# on a TodoList object, including iteration and selection.

class TodoList
  attr_accessor :title

  def initialize(title)
    @title = title
    @todos = []
  end

  # rest of class needs implementation
  def add(todo)
    unless todo.instance_of?(Todo)
      raise TypeError, "Can only add Todo objects"
    end
    @todos << todo
  end

  alias_method :<<, :add

  def size
    @todos.size
  end

  def first
    @todos[0]
  end

  def last
    @todos[-1]
  end

  def to_a
    @todos.clone
  end

  def to_s
    puts "---- Today's Todos ----"
    @todos.each { |item| puts item }
  end

  def item_at(idx)
    @todos.fetch(idx)
  end

  def mark_done_at(idx)
    @todos.fetch(idx).done!
  end

  def mark_undone_at(idx)
    @todos.fetch(idx).undone!
  end

  def done!
    @todos.each { |item| item.done! }
  end

  def done?
    @todos.all?(&:done?)
  end

  def shift
    @todos.shift
  end

  def pop
    @todos.pop
  end

  def remove_at(idx)
    to_delete = @todos.fetch(idx)
    @todos.delete(to_delete)
  end
end

# This class represents a todo item and its associated
# data: name and description. There's also a "done"
# flag to show whether this todo item is done.

class Todo
  DONE_MARKER = 'X'
  UNDONE_MARKER = ' '

  attr_accessor :title, :description, :done

  def initialize(title, description='')
    @title = title
    @description = description
    @done = false
  end

  def done!
    self.done = true
  end

  def done?
    done
  end

  def undone!
    self.done = false
  end

  def to_s
    "[#{done? ? DONE_MARKER : UNDONE_MARKER}] #{title}"
  end

  def ==(otherTodo)
    title == otherTodo.title &&
      description == otherTodo.description &&
      done == otherTodo.done
  end
end

# given
todo1 = Todo.new("Buy milk")
todo2 = Todo.new("Clean room")
todo3 = Todo.new("Go to gym")
list = TodoList.new("Today's Todos")

# ---- Adding to the list -----

# add
list.add(todo1)                 # adds todo1 to end of list, returns list
list.add(todo2)                 # adds todo2 to end of list, returns list
list << todo3                   # adds todo3 to end of list, returns list
list.add(1) rescue 'whoopsie'   # raises TypeError with message "Can only add Todo objects"

# <<
# same behavior as add

# ---- Interrogating the list -----

# size
p list.size                       # returns 3

# first
p list.first                      # returns todo1, which is the first item in the list

# last
p list.last                       # returns todo3, which is the last item in the list

#to_a
p list.to_a                      # returns an array of all items in the list

#done?
p list.done?                     # returns true if all todos in the list are done, otherwise false

# ---- Retrieving an item in the list ----

# item_at
p list.item_at rescue 'Wrong Arguments'   # raises ArgumentError
p list.item_at(1)                 # returns 2nd item in list (zero based index)
p list.item_at(100) rescue 'Index!'              # raises IndexError

# ---- Marking items in the list -----

# mark_done_at
p list.mark_done_at rescue 'Wrong args'              # raises ArgumentError
p list.mark_done_at(1)            # marks the 2nd item as done
p list.mark_done_at(100) rescue 'Index!'         # raises IndexError

# mark_undone_at
p list.mark_undone_at rescue 'Wrong args'            # raises ArgumentError
p list.mark_undone_at(1)          # marks the 2nd item as not done,
p list.mark_undone_at(100) rescue 'Index again'       # raises IndexError

# done!
list.done!                      # marks all items as done

# ---- Deleting from the list -----

# shift
# p list.shift                      # removes and returns the first item in list

# pop
# p list.pop                        # removes and returns the last item in list

# remove_at
list.remove_at rescue 'Argument'                 # raises ArgumentError
p list.remove_at(1)               # removes and returns the 2nd item
list.remove_at(100) rescue 'Index...'            # raises IndexError

# ---- Outputting the list -----

# to_s
list.to_s                      # returns string representation of the list

# ---- Today's Todos ----
# [ ] Buy milk
# [ ] Clean room
# [ ] Go to gym

# or, if any todos are done

# ---- Today's Todos ----
# [ ] Buy milk
# [X] Clean room
# [ ] Go to gym