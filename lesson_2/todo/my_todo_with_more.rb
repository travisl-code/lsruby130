
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
    output = "---- Today's Todos ----\n"
    output << @todos.map(&:to_s).join("\n")
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

  def each
    idx = 0

    while idx < @todos.size
      yield item_at(idx)
      idx += 1
    end

    self
  end

  def select
    new_list = TodoList.new('Default TodoList')
    each do |todo|
      new_list << todo if yield(todo)
    end
    new_list
  end

  def find_by_title(title)
    select do |todo|
      todo.title == title
    end.first
  end

  def all_done
    select do |todo|
      todo.done?
    end
  end

  def all_not_done
    select do |todo|
      !todo.done?
    end
  end

  def mark_done(title)
    results = find_by_title(title)
    results.done! if results.instance_of?(Todo)
  end

  alias_method :mark_all_done, :done!

  def mark_all_undone
    each do |todo|
      todo.undone!
    end
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
    return false unless otherTodo.instance_of?(self.class)
    title == otherTodo.title &&
      description == otherTodo.description &&
      done == otherTodo.done
  end
end

todo1 = Todo.new("Buy milk")
todo2 = Todo.new("Clean room")
todo3 = Todo.new("Go to gym")

list = TodoList.new("Today's Todos")
list.add(todo1)
list.add(todo2)
list.add(todo3)

# ---------- Testing -----------
# p list.find_by_title('Buy milk')
# p list.find_by_title('Pet cat')

# todo1.done!
# p list.all_done
# p list.all_done.object_id == list.object_id

# p list.all_not_done
# p list.all_not_done.object_id == list.object_id

# list.mark_done('Buy milk')
# p list

# list.mark_all_done
# p list

# list.mark_all_undone
# p list

# puts list